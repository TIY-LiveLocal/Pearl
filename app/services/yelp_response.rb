class YelpResponse

  attr_reader :raw_results, :results

  def initialize raw_results
    Rails.logger.debug("it's yelp response initialize.")
    @raw_results = raw_results
    @results = []
  end

  def process!
    @raw_results.each do |result|
      @results.push(self.class.process_result( result ))
    end
  end

  def self.process_result r
    {
          name:         r.name,
          address:      r.location.address.join(" "),
          zip_code:     r.location.postal_code,
          phone:        r.phone,
          city:         r.location.city,
          location:     [r.location.coordinate.latitude,
                         r.location.coordinate.longitude],
          image_url:    r.snippet_image_url,
          website_url:  r.url,
          categories:   r.categories.join(","),
          yelp_id:      r.id
    }
  end
end
