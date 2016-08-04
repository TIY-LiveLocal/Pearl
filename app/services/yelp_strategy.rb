class YelpStrategy

  attr_reader :response

  def self.run raw_results
    @duplicates_count = 0
    Rails.logger.debug("yelp other strategy")
    @response = YelpResponse.new(raw_results)
    @response.process!
    self.create_businesses!
  end

  def self.as_query raw_results
    @duplicates_count = 0
    @response = YelpResponse.new(raw_results)
    @response.process!
    @response.results
  end

  def self.create_businesses!
    @response.results.each do |result|
      b = Business.new(result)
      begin
        b.save!
      rescue ActiveRecord::RecordInvalid => e
        @duplicates_count += 1
        Rails.logger.debug(
          e.message +
          " (#{@duplicates_count} total errors) this one for business:\n" +
          b.to_json
        )
      end
    end
  end
end
