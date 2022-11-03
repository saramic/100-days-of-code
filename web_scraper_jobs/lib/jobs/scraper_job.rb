# frozen_string_literal: true

require "sidekiq"

$LOAD_PATH << File.join(__dir__, "../../lib")
Dir[File.join(__dir__, "../../lib/**/*.rb")].sort.each(&method(:require))

module Jobs
  class ScraperJob
    include Sidekiq::Worker

    def perform(*args)
      processor = args.shift
      Logger.new($stdout).warn("processor: " + processor.inspect)
      Kernel
        .const_get(processor)
        .new
        .perform(*args)
    end
  end
end
