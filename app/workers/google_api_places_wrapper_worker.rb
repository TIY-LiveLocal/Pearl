require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { db: 1 }
end

Sidekiq.configure_server do |config|
  config.redis = { db: 1 }
end

class GooglePlacesAPIWrapperWorker
  include Sidekiq::Worker

  def perform(location, term, limit=1)

    raw_results = GooglePlacesAPI.text_search({
       location: location,
       term: term
    })
    raw_results.each do |r|
      process_result r
    end
    YelpStrategy.run(raw_results)
  end

  def process_result r
    binding.pry
    sleep( rand(0..64)/1024.0 )
    YelpGemWrapperWorker.perform_async(
      location: r["formatted_address"],
      term:     r["name"]
    )
#    yr = YelpGemWrapper.find_business(location: r["formatted_address"], term: r["name"])
#    return unless yr
#    return YelpGemWrapper.process_result(yr)
  end
end
