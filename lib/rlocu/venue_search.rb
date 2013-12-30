module Rlocu
  VENUE_PARAMETERS = [:name, :has_menu, :category, :cuisine, :website_url, :open_at, :street_address, 
                        :locality, :region, :postal_code, :country, :location, :radius, :bounds]
  def self.venue_search(params, &block)    
    unsupported = params.keys.reduce([]) {|memo,p| memo << p unless VENUE_PARAMETERS.include? p; memo }
    raise ArgumentError.new "Unsupported parameter to Rlocu::VenuSearch (#{unsupported})" unless unsupported.empty?
  
  end
end