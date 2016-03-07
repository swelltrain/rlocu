module Rlocu
  class Venue
    ExternalID = Struct.new(:id, :url, :mobile_url)
    Category = Struct.new(:name, :str_id)
    Contact = Struct.new(:phone, :fax, :email, :phones, :faxes, :emails, :business_owner)
    # skipping Locu object for now
    Delivery = Struct.new(:will_deliver, :hours, :minimum_order, :areas)
    # skipping Extended object for now
    Media = Struct.new(:cover_photo, :venue_photos, :menu_photos, :logos, :videos)
    ATTRIBUTES = %i{locu_id name short_name description website_url menu_url menus menu_items open_hours external redirected_from categories location contact locu delivery extended media}

    ATTRIBUTES.each { |prop| attr_accessor prop }

    def initialize(venue)
      @external = []
      @categories = []
      @menus = []
      @not_supported_attributes = []
      build_from_hash(venue)
    end

    def build_from_hash(venue)
      venue.each do |k,v|
        begin
          self.send("#{k.to_s}=", v)
        rescue NoMethodError
          @not_supported_attributes << k
        end
      end
    end

    def latitude
      location.latitude
    end

    def longitude
      location.longitude
    end

    def not_supported_attributes
      @not_supported_attributes
    end

    def external=(externals_list)
      @external = []
      externals_list.each { |external_id| @external << ExternalID.new(id: external_id['id'], url: external_id['url'], mobile_url: external_id['mobile_url'])}
    end

    def categories=(categories_list)
      @categories = []
      categories_list.each do |category|
        c = Category.new
        category.each { |k,v| c.send("#{k.to_s}=", v) }
        @categories << c
      end
    end

    def location=(location)
      l = Location.new
      location.each { |k,v| l.send("#{k.to_s}=", v) }
      @location = l
    end

    def contact=(contact)
      c = Contact.new
      contact.each { |k,v| c.send("#{k.to_s}=", v) }
      @location = c
    end

    def delivery=(delivery)
      d = Delivery.new
      delivery.each { |k,v| d.send("#{k.to_s}=", v) }
      @location = l
    end

    def extended=(extended)
      e = Extended.new
      extended.each { |k,v| e.send("#{k.to_s}=", v) }
      @extended = e
    end

    def media=(media)
      m = Media.new
      media.each { |k,v| m.send("#{k.to_s}=", v) }
      @media = m
    end

    def menus=(menu_list)
      @menus = []
      menu_list.each do |menu|
        @menus << Menu.new(menu)
      end
    end

    class Location
      attr_reader :address1, :address2, :address3, :locality, :region, :postal_code, :country, :geo
      def initialize(location)
        @address1 = location['address1']
        @address2 = location['address2']
        @address3 = location['address3']
        @locality = location['locality']
        @region = location['region']
        @postal_code = location['postal_code']
        @country = location['country']
        @geo = GeoJSON.new(location['geo'])
      end

      def latitude
        geo.latitude
      end

      def longitude
        geo.longitude
      end
    end

    # skipping menu_items since they can be accessed through the menus and only 15 are returned currently
  end
end
