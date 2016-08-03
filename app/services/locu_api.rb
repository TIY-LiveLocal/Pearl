LOCU_API_URL = "https://api.locu.com/v2/venue/search"

#include WhatKindOfLocation

class LocuAPI

  include Enumerable

  attr_reader :postal_code, :description, :key, :fields, :headers, :location
  attr_accessor :raw_results

  def initialize ops={}
    @key                = ENV['locu_api_key']
    @location           = ops[:location].strip
    @location_hash      = {}
    @description        = ops[:description]
    @headers = { 'Content-Type' => 'application/json' }
    @raw_results = []
  end

 def each &block
    @raw_results["venues"].each do |r|
      block.call r
    end
  end

  def self.search ops={}
    new_search = self.new( ops )
    new_search.set_locational_attributes
    new_search.perform
    new_search.prepare
  end

  def perform
    body        = {
      "api_key": @key,
      "fields": ["name", "location", "categories"],
      "venue_queries": [{
        "location": @location_hash
      }]
    }
    @raw_results = HTTParty.post(
      LOCU_API_URL,
      headers: @headers,
      body: body.to_json
    )
  end

  def prepare
    @raw_results = @raw_results["venues"]
  end

  def set_locational_attributes
    with_zip_code?      && return
    with_city_state?    && return
  end

  private

  def with_zip_code?
    postal_string = ""
    matched = /(\d\d\d\d\d)([-]\d+)*/.match @location
    return unless matched
    postal_string += matched[1] if matched[1]
    postal_string += matched[2] if matched[2]

    if postal_string.length > 0
      @location_hash.merge! (
        {"postal_code": postal_string}
      )
    end
  end

  def with_city_state?
    matched = /([-A-Za-z ]+)\s*,\s*([A-Za-z]{2})($|\s)+/.match @location
    return unless matched
    if matched[1]
      @location_hash.merge! (
        {"region": matched[2]}
      )
    end

    if matched[2]
      @location_hash.merge! (
        {"locality": matched[1]}
      )
    end
  end

  # def self.circular_area_search ops={}
  #   o           = self.new(ops)
  #   lat_long    = GeocoderWrapper.for(@postal_code)
  #   radius      = 5000
  #   body        = {
  #     "api_key": o.key,
  #     "fields": o.fields,
  #     "venue_queries": [{
  #       "location": {
  #         "geo": {
  #           "$in_lat_lng_radius": [-37.7750, 122.4183, 5000]
  #         }
  #       }
  #     }]
  #   }
  # end

end
