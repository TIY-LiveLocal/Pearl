module YelpGemWrapper

  def self.for ops={}
    location    = ops[:location]
    term        = ops[:term]
    limit       = ops[:limit] ||= 1 # hard limit of 20 set by yelp
    return Yelp.client.search(location, {limit: limit, term: term}).businesses
  end

  def self.find_business ops={}
    location    = ops[:location]
    term        = ops[:term]
    Yelp.client.search(location, {limit: 1, term: term}).businesses.first
  end

end
