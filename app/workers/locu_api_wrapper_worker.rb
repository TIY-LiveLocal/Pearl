require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { db: 1 }
end

Sidekiq.configure_server do |config|
  config.redis = { db: 1 }
end

class LocuAPIWrapperWorker
  include Sidekiq::Worker

  def perform(location, term, limit=1)
    raw_results = LocuAPI.search({
       location: location,
       term: term
    })

    raw_results.each do |r|
      process_result r
    end
  end

  def process_result r
    sleep( rand(0..64)/1024.0 + 1)
    location = r["location"]["locality"] + ", " + r["location"]["region"]
    Rails.logger.debug(self.jid + location.to_s + " " + r["name"].to_s)
    YelpGemWrapperWorker.perform_async(
      location,
      r["name"]
    )
  end
end
