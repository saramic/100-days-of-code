# frozen_string_literal: true

require "open-uri"
require "nokogiri"
require "jobs/scraper_job"

module Processors
  class BsbNumbers
    URL = "https://www.thebsbnumbers.com"

    def perform(url = nil)
      url ||= URL
      # store in cache
      doc = Nokogiri::HTML(URI.open(url)) # rubocop:disable Security/Open
      title = doc.css("h2.headline").map(&:text)
      case title
      in ["Australian Bank BSB Numbers and SWIFT Codes", "International Bank Transfer", "List of Financial Institution Codes", "List of State Codes"]
        values = {
          title: title,
          breadcrumb: doc.css("div.breadcrumb:nth-of-type(1) a").map(&:text),
        }
        pp values
        title_index = nil
        doc
          .css(".sidebar > *")
          .each.with_index
          .find_all { |element, index|
          title_index = index if element.text.strip == "Banks"
          element.text == "Banks" || title_index == index - 1
        }[1][0] # TODO: find after child ?
          .css("li a")
          .map { |anchor| URL + anchor[:href] }
          .map do |url|
            # TODO: option to run inline or via sidekiq
            # Processors::BsbNumbers.new.perform(url)
            Jobs::ScraperJob.perform_async(self.class.to_s, url)
          end
      in [/.*Bank$/] # TODO: match NOT BSB Number
        values = {
          title: title,
          breadcrumb: doc.css("div.breadcrumb:nth-of-type(1) a").map(&:text),
        }
        pp values
        # TODO: deal with pagination
        table = doc.css("[itemprop=articleBody] table")
        table
          .css("tr a")
          .map { |anchor| URL + anchor[:href] }
          .map do |url|
            # TODO: option to run inline or via sidekiq
            # Processors::BsbNumbers.new.perform(url)
            Jobs::ScraperJob.perform_async(self.class.to_s, url)
          end
      in [/.*BSB Number (\d){3}-(\d){3}$/]
        table = doc.css("[itemprop=articleBody] table")
        values = {
          title: title,
          breadcrumb: doc.css("div.breadcrumb:nth-of-type(1) a").map(&:text),
        }.merge!(
          table
            .css("tr")
            .find_all { |row| !row.css("td").empty? }
            .map { |row| row.css("td").map(&:text) }
            .to_h,
        )
        pp values
      else
        raise ArgumentError, "don't know how to handle #{title.inspect}, for: #{url}"
      end
      # write it someplace as JSON
    rescue ArgumentError => e
      # $stderr e.message
      puts e
    end
  end
end
