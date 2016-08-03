LOCU_API_URL = "https://api.locu.com/v2/venue/search"

#include WhatKindOfLocation

class LocuAPI

  include Enumerable

  attr_reader :postal_code, :description, :key, :fields, :headers, :location
  attr_accessor :raw_results

  def initialize ops={}
    @key                = ENV['locu_api_key']
    @location           = ops[:location].strip
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
    new_search = self.new(ops)
    new_search.set_locational_attributes
    # body        = {
    #   "api_key": o.key,
    #   "fields": ["name", "location", "categories"],
    #   "venue_queries": [{
    #     "location": {
    #       @location_type=>@location
    #     }
    #   }]
    # }
    # binding.pry
    # o.raw_results = HTTParty.post(
    #   LOCU_API_URL,
    #   headers: o.headers,
    #   body: body.to_json
    # )
    # return o
  end

  def perform
    body        = {
      "api_key": o.key,
      "fields": ["name", "location", "categories"],
      "venue_queries": [{
        "location": {
          @location_type=>@location
        }
      }]
    }
    @raw_results = HTTParty.post(
      LOCU_API_URL,
      headers: o.headers,
      body: body.to_json
    )
  end


  def set_locational_attributes
    with_zip_code?      && return
    with_city_state?    && return
  end

  private

  def with_zip_code?
    return false if
      ( @location.gsub(/\d|-/,"").length > 0 )
    @location_type = "postal_code"
    return true
  end

  def with_city_state?
    matched = /([-A-Za-z ]+)\s*,\s*([A-Za-z]{2})($|\s)+/.match @location

    if matched[1]
      @location_hash = {"region": matched[2]}
    else
      return false
    end

    if matched[2]
      @location_hash.merge! (
    @city, @state = /([-A-Za-z ]+)\s*,\s*([A-Za-z]{2})($|\s)+/.match l
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
