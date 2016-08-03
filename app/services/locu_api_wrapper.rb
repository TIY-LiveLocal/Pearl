class LocuAPIWrapper

  include WhatKindOfLocuLocation

  attr_reader :results

  def initialize raw_results
    @raw_results    = raw_results
    @results        = []
  end

  def self.for ops={}
    ops[:description]   = ops[:term]
    ops[:postal_code]   = ops[:location]
    return self.new(LocuAPI.search( ops ))
  end

  def process!
    @raw_results.each do |result|
      @results.push(process_result( result ))
    end
  end

  private

  def process_result r
    sleep(rand(0..200)/1000.0)
    location = r["location"]["locality"] + ", " + r["location"]["region"]
    yr = YelpGemWrapper.find_business(location: location, term: r["name"])
    return unless yr
    yr2 = YelpGemWrapper.process_result(yr)

  end

  def location
    is_zipcode


    private


end
