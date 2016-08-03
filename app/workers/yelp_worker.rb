# require 'sidekiq'

# Sidekiq.configure_client do |config|
#   config.redis = { db: 1 }
# end

# Sidekiq.configure_server do |config|
#   config.redis = { db: 1 }
# end


# class YelpWorker
#   include Sidekiq::Worker

#   def perform
#     sleep 10
#     Business.create!(
#       name: "Awesome Business",
#       address: "Some address",
#       city: "Anytown",
#       zip_code: "27657",
#       phone: "3364566789",
#       yelp_id: "asd-asdf-asdf-asdf"
#     )
#   end
# end
