class YelpSearch

  def self.for(ops={})
    location    = ops[:zip_code]
    if ops[:location]
      location = ops[:location]
    end
    term        = ops[:term] ||='food'

    @raw_results = YelpGemWrapper.for(
      location: location,
      term:     term,
      limit:    limit ||= 20
    )
    @results = YelpStrategy.as_query( @raw_results )
    return @results
  end

end
