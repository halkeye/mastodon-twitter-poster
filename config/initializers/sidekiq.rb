require_relative "../../lib/twitter/entity/permalink.rb"
require 'statsd'

Sidekiq.configure_server do |config|
  config.server_middleware do |chain|
    chain.add Sidekiq::Statsd::ServerMiddleware, env: RAILS.env, prefix: "worker", statsd: Stats.stats if Stats.enabled?
  end
end
