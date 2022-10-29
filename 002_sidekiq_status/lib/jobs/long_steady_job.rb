# frozen_string_literal: true

require "sidekiq"

module Jobs
  class LongSteadyJob
    include Sidekiq::Job

    def perform(duration = 60)
      @start = Time.now
      while (Time.now.to_i - @start.to_i) < duration
        sleep 1
      end
    end
  end
end