module Rlocu
  class VenueQuery
    def initialize(query_fields:, return_fields:)
      raise ArgumentError, 'Query Fields Param must be a hash of fields: values.' unless query_fields.is_a? Hash
    end
  end
end
