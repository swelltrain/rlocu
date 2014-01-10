require 'open-uri'
require 'JSON'

module Rlocu
  module VenueDetails

    def self.query(venues, &block)  
      response = {}
      open(url(venues)) { |request| response = JSON.parse(request.read) }
      # should we update the venues passed in or should we create new venue
      # objects with the updated info? lets create new ones 

      venues_w_details = []
      response['objects'].each do |object|
        venues_w_details << Venue.new(object)
      end
      venues_w_details.each { |venue| yield venue } if block_given?
      return venues_w_details
    end 

    private

    def self.url(venues)
      ids = reduce_ids(venues)
      "#{Rlocu.http_base}venue/#{ids}/?#{Rlocu.encode}"
    end

    def self.reduce_ids(venues)
      raise ArgumentError.new "Only 5 venues can be queried at a time for venue details" if venues.count > 5
      ids = venues.reduce('') {|memo, venue| memo << "#{venue.id};"}
      ids.chop
    end

  end
end