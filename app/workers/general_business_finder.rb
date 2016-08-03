# require 'sidekiq'

# Sidekiq.configure_client do |config|
#   config.redis = { db: 1 }
# end

# Sidekiq.configure_server do |config|
#   config.redis = { db: 1 }
# end

# class GeneralBusinessFinder
#   include Sidekiq::Worker

#   def initialize
#     @results =      []
#   end

#   def perform ops={}

#     @businesses         = []
#     @duplicates_count   = 0
#     Rails.logger.debug(ops)
#     post_initialization ops
#     run
#   end

#   # def create_businesses!
#   #   @api_request.process!
#   #   @api_request.results.each do |result|
#   #     b = Business.new(result)
#   #     begin
#   #       b.save!
#   #       @businesses.push b
#   #     rescue ActiveRecord::RecordInvalid => e
#   #       @duplicates_count += 1

#   #       Rails.logger.debug(
#   #         e.message +
#   #         " (#{@duplicates_count} total errors) this one for business:\n" +
#   #         b.to_json
#   #       )
#   #     end
#   #   end
#   # end



#   # #Rails.logger.debug("hey you!")
#   # #Rails.logger.debug(ops)
#   # Rails.logger.debug(ops)
#   # strategies = ops["strategies"]

#   # ['YelpStrategy'].each do |strategy|
#   #   Rails.logger.debug("hey hey")
#   #   #next unless Object.const_defined?(strategy)
#   #   c = Object.const_get(strategy)
#   #   Rails.logger.debug(ops)
#   #   ops[:term] = ops["term"]
#   #   ops[:location] = ops["location"]
#   #   o = c.new(ops)
#   #   o.create_businesses!
#   # end

#   #     strategies.each do |strategy|
#   #       next unless Object.const_defined?(strategy.to_s)
#   #       o = strategy.new(ops)
#   #       o.create_businesses!
#   # #      @results += o.businesses
#   # #     binding.pry
#   #       #     break if @results.count >= 20
#   #     end

#   #    binding.pry
#   #22.times do
#   #  @results.push(FactoryGirl.create :business)
#   #end
#   #    @results.compact!        # TODO: place this closer to the source
#   #    return @results

#   #end

#   #  def page_results
#   #    binding.pry
#   #  end
# end
