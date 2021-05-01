require_relative "../../lib/twitter/entity/permalink.rb"
require 'statsd'

Sidekiq.configure_server do |config|
  config.server_middleware do |chain|
    chain.add Sidekiq::Statsd::ServerMiddleware, env: Rails.env, prefix: "worker", statsd: Stats.new.statsd if Stats.enabled?
  end
end
