# frozen_string_literal: true

require "bundler/setup"
Bundler.require(:default)

def db_configuration
  db_configuration_file = File.join(
    File.expand_path(__dir__), "../db/config.yml"
  )
  YAML.safe_load(File.read(db_configuration_file), aliases: true)
end

ActiveRecord::Base.establish_connection(
  db_configuration["development"],
)
