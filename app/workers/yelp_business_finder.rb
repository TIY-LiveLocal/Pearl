# class YelpBusinessFinder < GeneralBusinessFinder
#   include Sidekiq::Worker

#   def post_initialization ops={}

#     Rails.logger.debug("its yelp business finder!")
#     Rails.logger.debug(ops)
#     @api_request       = YelpGemWrapper.for(ops)
#   end

#   def run
#     Rails.logger.debug("yelpbusinessfinder#run")
#   end
# end
