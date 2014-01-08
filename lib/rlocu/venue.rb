module Rlocu
  class Venue
    PROPERTIES = [:name, :locality, :street_address, 
      :cuisines, :region, :long, :phone, :postal_code, 
      :categories, :has_menu, :country, :lat, :id, 
      :website_url, :resource_uri]
    # the Venue class encapsulates the venue_details also
    # keeping them separate for maintainability when they eventually change
    VENUE_DETAILS = [:open_hours, :facebook_url, :twitter_id,
      :similar_venues, :redirected_from]
    attr_reader :menus
    (PROPERTIES | VENUE_DETAILS).each {|prop| attr_accessor prop}

    def initialize(meta_venue)
      @menus = []
      update(meta_venue)
    end
    
    def update(meta_venue)
      meta_venue.each {|k,v| self.send("#{k.to_s}=",v) }
    end

    # override some of the writers
    def menus=(meta_menus)
      # menus is an array of menu hashes
      # don't keep adding and duplicating if there are already menus
      @menus = []        
      meta_menus.each do |h|
        @menus << Menu.new(h)
      end
    end

  end
end