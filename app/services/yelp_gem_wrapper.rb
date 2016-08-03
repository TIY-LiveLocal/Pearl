module YelpGemWrapper

  def self.for ops={}
    location    = ops[:location]
    term        = ops[:term]
    limit       = ops[:limit] ||= 1 # hard limit of 20 set by yelp
    Yelp.client.search(location, {limit: limit, term: term}).businesses
  end

  def self.find_business ops={}
    location    = ops[:location]
    term        = ops[:term]
    limit       = ops[:limit]
    Yelp.client.search(location, {limit: 1, term: term}).businesses.first
  end
end
