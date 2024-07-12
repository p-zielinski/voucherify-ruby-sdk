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
  # Response body schema for POST `/validations`.
  class ValidationsValidateResponseBody
    # The result of the validation. It takes all of the redeemables into account and returns a `false` if at least one redeemable is inapplicable. Returns `true` if all redeemables are applicable.
    attr_accessor :valid

    attr_accessor :redeemables

    # Lists validation results of each skipped redeemable.
    attr_accessor :skipped_redeemables

    # Lists validation results of each inapplicable redeemable.
    attr_accessor :inapplicable_redeemables

    attr_accessor :order

    # Hashed customer source ID.
    attr_accessor :tracking_id

    attr_accessor :session

    attr_accessor :stacking_rules

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'valid' => :'valid',
        :'redeemables' => :'redeemables',
        :'skipped_redeemables' => :'skipped_redeemables',
        :'inapplicable_redeemables' => :'inapplicable_redeemables',
        :'order' => :'order',
        :'tracking_id' => :'tracking_id',
        :'session' => :'session',
        :'stacking_rules' => :'stacking_rules'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'valid' => :'Boolean',
        :'redeemables' => :'Array<ValidationsValidateResponseBodyRedeemablesItem>',
        :'skipped_redeemables' => :'Array<ValidationsRedeemableSkipped>',
        :'inapplicable_redeemables' => :'Array<ValidationsRedeemableInapplicable>',
        :'order' => :'OrderCalculated',
        :'tracking_id' => :'String',
        :'session' => :'Session',
        :'stacking_rules' => :'StackingRules'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'valid',
        :'redeemables',
        :'skipped_redeemables',
        :'inapplicable_redeemables',
        :'tracking_id',
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `VoucherifySdk::ValidationsValidateResponseBody` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `VoucherifySdk::ValidationsValidateResponseBody`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'valid')
        self.valid = attributes[:'valid']
      end

      if attributes.key?(:'redeemables')
        if (value = attributes[:'redeemables']).is_a?(Array)
          self.redeemables = value
        end
      end

      if attributes.key?(:'skipped_redeemables')
        if (value = attributes[:'skipped_redeemables']).is_a?(Array)
          self.skipped_redeemables = value
        end
      end

      if attributes.key?(:'inapplicable_redeemables')
        if (value = attributes[:'inapplicable_redeemables']).is_a?(Array)
          self.inapplicable_redeemables = value
        end
      end

      if attributes.key?(:'order')
        self.order = attributes[:'order']
      end

      if attributes.key?(:'tracking_id')
        self.tracking_id = attributes[:'tracking_id']
      end

      if attributes.key?(:'session')
        self.session = attributes[:'session']
      end

      if attributes.key?(:'stacking_rules')
        self.stacking_rules = attributes[:'stacking_rules']
      else
        self.stacking_rules = nil
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      if @stacking_rules.nil?
        invalid_properties.push('invalid value for "stacking_rules", stacking_rules cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      return false if @stacking_rules.nil?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          valid == o.valid &&
          redeemables == o.redeemables &&
          skipped_redeemables == o.skipped_redeemables &&
          inapplicable_redeemables == o.inapplicable_redeemables &&
          order == o.order &&
          tracking_id == o.tracking_id &&
          session == o.session &&
          stacking_rules == o.stacking_rules
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [valid, redeemables, skipped_redeemables, inapplicable_redeemables, order, tracking_id, session, stacking_rules].hash
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
