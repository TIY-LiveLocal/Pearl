class NearbyBusinesses

  def self.for(ops={})
    # yelp is good, yelp is fast

    YelpStrategy.run(YelpGemWrapper.for(
                      location: ops[:zip_code],
                      term:     ops[:term]  ||= 'food',
                      limit:    ops[:limit] ||= 20
                    ))

    @results = Business.
               where(zip_code: ops[:zip_code]) #.
               # for kaminari #
               #page(ops[:page])

  end
end
