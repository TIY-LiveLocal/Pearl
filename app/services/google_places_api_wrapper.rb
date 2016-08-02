GOOGLE_API_URL = "https://maps.googleapis.com/maps/api/place/textsearch/json?"

class GooglePlacesAPIWrapper

  include Enumerable

  attr_reader :results, :raw_results

  def initialize raw_results
    @raw_results    = raw_results
    @results        = []
  end

  def self.for ops={}
    location    = ops[:location]
    term        = ops[:term]
    GooglePlacesAPI.search({location: location, term: term})
  end

  def each &block
    @raw_results.each do |r|
      block.call r
    end
  end

  def process!
    @raw_results.each do |result|
      @results.push(process_result( result ))
    end
  end

private

def process_result r
  binding.pry
    sleep( rand(0..64)/1024.0 )
    yr = YelpGemWrapper.find_business(location: r["formatted_address"], term: r["name"])
    return unless yr
    return YelpGemWrapper.process_result(yr)
  end
end
