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
  class ListPublicationsItemBase
    # Unique publication ID, assigned by Voucherify.
    attr_accessor :id

    # The type of object represented by the JSON. This object stores information about the `publication`.
    attr_accessor :object

    # Timestamp representing the date and time when the publication was created in ISO 8601 format.
    attr_accessor :created_at

    # Unique customer ID of the customer receiving the publication.
    attr_accessor :customer_id

    # Customer's `source_id`.
    attr_accessor :tracking_id

    # The metadata object stores all custom attributes assigned to the publication. A set of key/value pairs that you can attach to a publication object. It can be useful for storing additional information about the publication in a structured format.
    attr_accessor :metadata

    # How the publication was originated. It can be your own custom channel or an example value provided here.
    attr_accessor :channel

    # The merchant’s publication ID if it is different from the Voucherify publication ID. It's an optional tracking identifier of a publication. It is really useful in case of an integration between multiple systems. It can be a publication ID from a CRM system, database or 3rd-party service. 
    attr_accessor :source_id

    attr_accessor :customer

    # Contains the unique internal voucher ID that was assigned by Voucherify.
    attr_accessor :vouchers_id

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
        :'object' => :'object',
        :'created_at' => :'created_at',
        :'customer_id' => :'customer_id',
        :'tracking_id' => :'tracking_id',
        :'metadata' => :'metadata',
        :'channel' => :'channel',
        :'source_id' => :'source_id',
        :'customer' => :'customer',
        :'vouchers_id' => :'vouchers_id'
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
        :'object' => :'String',
        :'created_at' => :'Time',
        :'customer_id' => :'String',
        :'tracking_id' => :'String',
        :'metadata' => :'Object',
        :'channel' => :'String',
        :'source_id' => :'String',
        :'customer' => :'CustomerWithSummaryLoyaltyReferrals',
        :'vouchers_id' => :'Array<String>'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'source_id',
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `VoucherifySdk::ListPublicationsItemBase` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `VoucherifySdk::ListPublicationsItemBase`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'id')
        self.id = attributes[:'id']
      else
        self.id = nil
      end

      if attributes.key?(:'object')
        self.object = attributes[:'object']
      else
        self.object = 'publication'
      end

      if attributes.key?(:'created_at')
        self.created_at = attributes[:'created_at']
      else
        self.created_at = nil
      end

      if attributes.key?(:'customer_id')
        self.customer_id = attributes[:'customer_id']
      else
        self.customer_id = nil
      end

      if attributes.key?(:'tracking_id')
        self.tracking_id = attributes[:'tracking_id']
      end

      if attributes.key?(:'metadata')
        self.metadata = attributes[:'metadata']
      else
        self.metadata = nil
      end

      if attributes.key?(:'channel')
        self.channel = attributes[:'channel']
      else
        self.channel = nil
      end

      if attributes.key?(:'source_id')
        self.source_id = attributes[:'source_id']
      else
        self.source_id = nil
      end

      if attributes.key?(:'customer')
        self.customer = attributes[:'customer']
      else
        self.customer = nil
      end

      if attributes.key?(:'vouchers_id')
        if (value = attributes[:'vouchers_id']).is_a?(Array)
          self.vouchers_id = value
        end
      else
        self.vouchers_id = nil
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      if @id.nil?
        invalid_properties.push('invalid value for "id", id cannot be nil.')
      end

      if @object.nil?
        invalid_properties.push('invalid value for "object", object cannot be nil.')
      end

      if @created_at.nil?
        invalid_properties.push('invalid value for "created_at", created_at cannot be nil.')
      end

      if @customer_id.nil?
        invalid_properties.push('invalid value for "customer_id", customer_id cannot be nil.')
      end

      if @metadata.nil?
        invalid_properties.push('invalid value for "metadata", metadata cannot be nil.')
      end

      if @channel.nil?
        invalid_properties.push('invalid value for "channel", channel cannot be nil.')
      end

      if @customer.nil?
        invalid_properties.push('invalid value for "customer", customer cannot be nil.')
      end

      if @vouchers_id.nil?
        invalid_properties.push('invalid value for "vouchers_id", vouchers_id cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      return false if @id.nil?
      return false if @object.nil?
      object_validator = EnumAttributeValidator.new('String', ["publication"])
      return false unless object_validator.valid?(@object)
      return false if @created_at.nil?
      return false if @customer_id.nil?
      return false if @metadata.nil?
      return false if @channel.nil?
      return false if @customer.nil?
      return false if @vouchers_id.nil?
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] object Object to be assigned
    def object=(object)
      validator = EnumAttributeValidator.new('String', ["publication"])
      unless validator.valid?(object)
        fail ArgumentError, "invalid value for \"object\", must be one of #{validator.allowable_values}."
      end
      @object = object
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          object == o.object &&
          created_at == o.created_at &&
          customer_id == o.customer_id &&
          tracking_id == o.tracking_id &&
          metadata == o.metadata &&
          channel == o.channel &&
          source_id == o.source_id &&
          customer == o.customer &&
          vouchers_id == o.vouchers_id
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [id, object, created_at, customer_id, tracking_id, metadata, channel, source_id, customer, vouchers_id].hash
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
