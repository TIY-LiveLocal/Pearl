require 'sidekiq'
require 'locu_api_wrapper_worker'
require 'google_places_api_wrapper_worker'

Sidekiq.configure_client do |config|
  config.redis = { db: 1 }
end

Sidekiq.configure_server do |config|
  config.redis = { db: 1 }
end


class BusinessFinderWorker
  include Sidekiq::Worker

  def initialize
    @results =      []
  end

  def perform(location, term)
    LocuAPIWrapperWorker.perform_async(
      location,
      term
    )
    GooglePlacesAPIWrapperWorker.perform_async(
      location,
      term
    )
  end
    #Rails.logger.debug("hey you!")
    #Rails.logger.debug(ops)
#    Rails.logger.debug(ops)
#    strategies = ops["strategies"]


#    ['YelpStrategy'].each do |strategy|
#      Rails.logger.debug("hey hey")
      #next unless Object.const_defined?(strategy)
#      c = Object.const_get(strategy)
#      Rails.logger.debug(ops)
#      ops[:term] = ops["term"]
#      ops[:location] = ops["location"]
#      o = c.new(ops)
#      o.create_businesses!
#    end

#     strategies.each do |strategy|
#       next unless Object.const_defined?(strategy.to_s)
#       o = strategy.new(ops)
#       o.create_businesses!
# #      @results += o.businesses
# #     binding.pry
#       #     break if @results.count >= 20
#     end

#    binding.pry
    #22.times do
    #  @results.push(FactoryGirl.create :business)
    #end
#    @results.compact!        # TODO: place this closer to the source
#    return @results
#  end

#  def page_results
#    binding.pry
#  end
end
