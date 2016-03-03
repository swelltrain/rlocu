module Rlocu
  module Query
    def base_url
      "https://api.locu.com/v2/venue/search"
    end

    class QueryCondition
      attr_reader :key_value_conditions
      def initialize(key_value_conditions:)
        @key_value_conditions = key_value_conditions
      end

      def to_h
        h = {}
        key_value_conditions.each { |condition| h.merge!(condition.to_h) }
        h
      end
    end

    class KeyValueCondition
      attr_reader :key, :value, :condition
      ValidConditions = %w{$present $gt $lt $ge $le $contains_any $contains_all $contains_none $in_lat_lng_bbox $in_lat_lng_radius} << nil
      def initialize(key:, value:, condition: nil)
        @key = key
        @value = value
        @condition = condition
        raise ArgumentError unless valid?
      end

      def to_h
        if condition
          if value.is_a?(Utilities::LatLongRadius)
            {key => {'geo' => {condition => value.to_a}}}
          else
            {key => {condition => value}}
          end
        else
          {key => value}
        end
      end

      private
      def valid?
        # check if the condition and value are appropriate
        return false unless ValidConditions.include? condition
        return false if condition =~ /\$in_lat_lng/ && !value.is_a?(Utilities::LatLongRadius)
        true
      end
    end
  end
end
