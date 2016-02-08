module Rlocu
  module Query
    def base_url
      "https://api.locu.com/v2/venue/search"
    end

    class QueryCondition
      attr_reader :key, :value, :condition
      ValidConditions = %w{$present $gt $lt $ge $le $contains_any $contains_all $contains_none $in_lat_lng_bbox $in_lat_lng_radius} << nil
      def initialize(key:, value:, condition: nil)
        @key = key
        @value = value
        @condition = condition
        raise ArgumentError unless valid?
      end

      def to_h
        # if key is location and value is_a? LatLong
      end

      private
      def valid?
        # check if the condition and value are appropriate
        return false unless ValidConditions.include? condition
      end
    end
  end
end
