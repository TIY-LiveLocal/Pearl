class NearbyBusinesses
  def self.for(ops={})

    # yelp is good, yelp is fast

    # give sidekiq positional arguments

    location    = ops[:zip_code],
    term        = ops[:term] ||='food'

    YelpStrategy.run(YelpGemWrapper.for(
                      location: ops[:zip_code],
                      term:     ops[:term]  ||= 'food',
                      limit:    limit ||= 20
                    ))

    BusinessFinderWorker.perform_async(
      location,
      term
    )

    @results = Business.
               where(zip_code: ops[:zip_code]).
               page(ops[:page])

    return @results
  end
end
