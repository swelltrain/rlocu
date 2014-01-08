require 'open-uri'
require 'JSON'

module Rlocu
  module VenueSearch
    PARAMETERS = [:name, :has_menu, :category, :cuisine, :website_url, :open_at, :street_address, 
                  :locality, :region, :postal_code, :country, :location, :radius, :bounds]
    
    def self.query(params, &block)    
      unsupported = params.keys.reduce([]) {|memo,p| memo << p unless PARAMETERS.include? p; memo }
      raise ArgumentError.new "Unsupported parameter to Rlocu::VenuSearch (#{unsupported})" unless unsupported.empty?
      response = {}
      open(url(params)) {|request| response = JSON.parse(request.read)}
      venues = []
      venues = response['objects'].reduce(venues) {|arr, o| arr << Rlocu::Venue.new(o) ; arr }
      venues.each { |venue| yield venue } if block_given?
      return venues
    end

    private

    def self.url(params)
      "#{Rlocu.http_base}venue/search/?#{Rlocu.encode(params)}"
    end
    
  end
end