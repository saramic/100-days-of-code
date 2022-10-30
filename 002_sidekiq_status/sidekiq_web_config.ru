# frozen_string_literal: true

require "sidekiq/web"
require "sidekiq-status/web"
$LOAD_PATH << __dir__
require "config/environment.rb"

use Rack::Session::Cookie,
  secret: File.read(".session.key"),
  same_site: true,
  max_age: 86_400

run Sidekiq::Web
