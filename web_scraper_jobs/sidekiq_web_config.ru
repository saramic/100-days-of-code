# frozen_string_literal: true

require "sidekiq/web"
require "rack/session"

use Rack::Session::Cookie,
  secret: File.read(".session.key"),
  same_site: true,
  max_age: 86_400

run Sidekiq::Web
