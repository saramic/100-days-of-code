# frozen_string_literal: true

require "sidekiq"
require "sidekiq-status"
$LOAD_PATH << File.join(__dir__, "../../")
require "config/environment"

module Jobs
  class LongSteadyJob
    include Sidekiq::Worker
    include Sidekiq::Status::Worker

    def perform(duration = 60)
      @start = Time.now
      while (Time.now.to_f - @start.to_i) < duration
        sleep 1
        percentage = ((Time.now.to_f - @start.to_i) / duration) * 100
        percentage = 100 if percentage > 100.0
        at percentage
      end
    end
  end
end