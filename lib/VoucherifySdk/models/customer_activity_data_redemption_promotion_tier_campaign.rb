=begin
#Voucherify API

#Voucherify promotion engine REST API. Please see https://docs.voucherify.io/docs for more details.

The version of the OpenAPI document: v2018-08-01
Contact: support@voucherify.io
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 7.0.1

=end

require 'date'
require 'time'

module VoucherifySdk
  class CustomerActivityDataRedemptionPromotionTierCampaign
    # Unique campaign ID.
    attr_accessor :id

    # Activation timestamp defines when the campaign starts to be active in ISO 8601 format. Campaign is *inactive before* this date. 
    attr_accessor :start_date

    # Expiration timestamp defines when the campaign expires in ISO 8601 format.  Campaign is *inactive after* this date.
    attr_accessor :expiration_date

    attr_accessor :validity_timeframe

    # Integer array corresponding to the particular days of the week in which the voucher is valid.  - `0` Sunday - `1` Monday - `2` Tuesday - `3` Wednesday - `4` Thursday - `5` Friday - `6` Saturday
    attr_accessor :validity_day_of_week

    attr_accessor :validity_hours

    # A flag indicating whether the campaign is active or not active. A campaign can be disabled even though it's within the active period defined by the `start_date` and `expiration_date` using the <!-- [Disable Campaign](OpenAPI.json/paths/~1campaigns~1{campaignId}~1disable) -->[Disable Campaign](ref:disable-campaign) endpoint.    - `true` indicates an *active* campaign - `false` indicates an *inactive* campaign
    attr_accessor :active

    # Unique category ID that this campaign belongs to.
    attr_accessor :category_id

    # The type of the object represented by the campaign object. This object stores information about the campaign.
    attr_accessor :object

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'id' => :'id',
        :'start_date' => :'start_date',
        :'expiration_date' => :'expiration_date',
        :'validity_timeframe' => :'validity_timeframe',
        :'validity_day_of_week' => :'validity_day_of_week',
        :'validity_hours' => :'validity_hours',
        :'active' => :'active',
        :'category_id' => :'category_id',
        :'object' => :'object'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'id' => :'String',
        :'start_date' => :'Time',
        :'expiration_date' => :'Time',
        :'validity_timeframe' => :'ValidityTimeframe',
        :'validity_day_of_week' => :'Array<Integer>',
        :'validity_hours' => :'ValidityHours',
        :'active' => :'Boolean',
        :'category_id' => :'String',
        :'object' => :'String'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'id',
        :'start_date',
        :'expiration_date',
        :'active',
        :'category_id',
        :'object'
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        h[k.to_sym] = v
      }

      if attributes.key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.key?(:'start_date')
        self.start_date = attributes[:'start_date']
      end

      if attributes.key?(:'expiration_date')
        self.expiration_date = attributes[:'expiration_date']
      end

      if attributes.key?(:'validity_timeframe')
        self.validity_timeframe = attributes[:'validity_timeframe']
      end

      if attributes.key?(:'validity_day_of_week')
        if (value = attributes[:'validity_day_of_week']).is_a?(Array)
          self.validity_day_of_week = value
        end
      end

      if attributes.key?(:'validity_hours')
        self.validity_hours = attributes[:'validity_hours']
      end

      if attributes.key?(:'active')
        self.active = attributes[:'active']
      end

      if attributes.key?(:'category_id')
        self.category_id = attributes[:'category_id']
      end

      if attributes.key?(:'object')
        self.object = attributes[:'object']
      else
        self.object = 'campaign'
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          start_date == o.start_date &&
          expiration_date == o.expiration_date &&
          validity_timeframe == o.validity_timeframe &&
          validity_day_of_week == o.validity_day_of_week &&
          validity_hours == o.validity_hours &&
          active == o.active &&
          category_id == o.category_id &&
          object == o.object
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [id, start_date, expiration_date, validity_timeframe, validity_day_of_week, validity_hours, active, category_id, object].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      attributes = attributes.transform_keys(&:to_sym)
      transformed_hash = {}
      openapi_types.each_pair do |key, type|
        if attributes.key?(attribute_map[key]) && attributes[attribute_map[key]].nil?
          transformed_hash["#{key}"] = nil
        elsif type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[attribute_map[key]].is_a?(Array)
            transformed_hash["#{key}"] = attributes[attribute_map[key]].map { |v| _deserialize($1, v) }
          end
        elsif !attributes[attribute_map[key]].nil?
          transformed_hash["#{key}"] = _deserialize(type, attributes[attribute_map[key]])
        end
      end
      new(transformed_hash)
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def self._deserialize(type, value)
      case type.to_sym
      when :Time
        Time.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        # models (e.g. Pet) or oneOf
        klass = VoucherifySdk.const_get(type)
        klass.respond_to?(:openapi_one_of) ? klass.build(value) : klass.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = self.class.openapi_nullable.include?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end

        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
