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
  # This is an object representing an asynchronous action.
  class AsyncAction
    # Async action unique ID.
    attr_accessor :id

    # Type of async action. Examples: \"CAMPAIGN.VOUCHERS_IMPORT\", \"CAMPAIGN.VOUCHERS_IMPORT_CSV\", \"CAMPAIGN.VOUCHERS_UPDATE\", \"CAMPAIGN.VOUCHERS_DELETE\", \"CAMPAIGN.VOUCHERS_GENERATE\", \"CAMPAIGNS.METADATA_KEY_PURGE\", \"CUSTOMERS.IMPORT_CSV\", \"CUSTOMERS.BULK_UPDATE\", \"CUSTOMERS.METADATA_UPDATE\", \"CUSTOMERS.METADATA_KEY_PURGE\", \"PRODUCTS.BULK_UPDATE\", \"PRODUCTS.METADATA_UPDATE\", \"PRODUCTS.METADATA_KEY_PURGE\", \"PRODUCTS.IMPORT_CSV\", \"SKUS.IMPORT_CSV\", \"VOUCHERS.IMPORT\", \"VOUCHERS.IMPORT_CSV\", \"VOUCHERS.BULK_UPDATE\", \"VOUCHERS.METADATA_UPDATE\", \"VOUCHERS.METADATA_KEY_PURGE\", \"ORDERS.IMPORT\", \"ORDERS.METADATA_KEY_PURGE\"
    attr_accessor :type

    # Status of async action. Informs you whether the async action has already been completed.
    attr_accessor :status

    # Status of async action processing. Informs about the async action status, whether it failed, succeeded, or the status is unknown. Examples: \"FAILED\", \"SUCCESS\"
    attr_accessor :operation_status

    # Timestamp representing the date and time when the async action was scheduled in ISO 8601 format.
    attr_accessor :created_at

    # Timestamp representing the date and time when the async action was updated. The value is shown in the ISO 8601 format.
    attr_accessor :updated_at

    # Unique request ID.
    attr_accessor :request_id

    # The length of time it took to process the request in milliseconds.
    attr_accessor :processing_time

    # % progress to completion of the asynchronous action.
    attr_accessor :progress

    # The type of the object represented by JSON. This object stores information about the `async_action`.
    attr_accessor :object

    attr_accessor :result

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
        :'type' => :'type',
        :'status' => :'status',
        :'operation_status' => :'operation_status',
        :'created_at' => :'created_at',
        :'updated_at' => :'updated_at',
        :'request_id' => :'request_id',
        :'processing_time' => :'processing_time',
        :'progress' => :'progress',
        :'object' => :'object',
        :'result' => :'result'
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
        :'type' => :'String',
        :'status' => :'String',
        :'operation_status' => :'String',
        :'created_at' => :'Time',
        :'updated_at' => :'Time',
        :'request_id' => :'String',
        :'processing_time' => :'Integer',
        :'progress' => :'Integer',
        :'object' => :'String',
        :'result' => :'Object'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'id',
        :'type',
        :'status',
        :'operation_status',
        :'created_at',
        :'updated_at',
        :'request_id',
        :'processing_time',
        :'progress',
        :'object',
        :'result'
      ])
    end

    # List of class defined in allOf (OpenAPI v3)
    def self.openapi_all_of
      [
      :'AsyncActionBase'
      ]
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

      if attributes.key?(:'type')
        self.type = attributes[:'type']
      end

      if attributes.key?(:'status')
        self.status = attributes[:'status']
      end

      if attributes.key?(:'operation_status')
        self.operation_status = attributes[:'operation_status']
      end

      if attributes.key?(:'created_at')
        self.created_at = attributes[:'created_at']
      end

      if attributes.key?(:'updated_at')
        self.updated_at = attributes[:'updated_at']
      end

      if attributes.key?(:'request_id')
        self.request_id = attributes[:'request_id']
      end

      if attributes.key?(:'processing_time')
        self.processing_time = attributes[:'processing_time']
      end

      if attributes.key?(:'progress')
        self.progress = attributes[:'progress']
      end

      if attributes.key?(:'object')
        self.object = attributes[:'object']
      else
        self.object = 'async_action'
      end

      if attributes.key?(:'result')
        self.result = attributes[:'result']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      if !@progress.nil? && @progress > 100
        invalid_properties.push('invalid value for "progress", must be smaller than or equal to 100.')
      end

      if !@progress.nil? && @progress < 0
        invalid_properties.push('invalid value for "progress", must be greater than or equal to 0.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      status_validator = EnumAttributeValidator.new('String', ["ENQUEUED", "IN_PROGRESS", "DONE", "FAILED"])
      return false unless status_validator.valid?(@status)
      return false if !@progress.nil? && @progress > 100
      return false if !@progress.nil? && @progress < 0
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          type == o.type &&
          status == o.status &&
          operation_status == o.operation_status &&
          created_at == o.created_at &&
          updated_at == o.updated_at &&
          request_id == o.request_id &&
          processing_time == o.processing_time &&
          progress == o.progress &&
          object == o.object &&
          result == o.result
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [id, type, status, operation_status, created_at, updated_at, request_id, processing_time, progress, object, result].hash
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
