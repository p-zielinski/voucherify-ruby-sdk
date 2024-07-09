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
  # Defines stacking rules for redeemables. Read more in the [Help Center](https://support.voucherify.io/article/604-stacking-rules)
  class StackingRules
    # Defines how many redeemables can be sent in one stacking request (note: more redeemables means more processing time!).
    attr_accessor :redeemables_limit

    # Defines how many of the sent redeemables will be applied to the order. For example, a user can select 30 discounts but only 5 will be applied to the order and the remaining will be labelled as SKIPPED.
    attr_accessor :applicable_redeemables_limit

    # Defines how many redeemables per category can be applied in one request.
    attr_accessor :applicable_redeemables_per_category_limit

    # Defines how many redeemables with an exclusive category can be applied in one request.
    attr_accessor :applicable_exclusive_redeemables_limit

    # Defines how many redeemables with an exclusive category per category in stacking rules can be applied in one request.
    attr_accessor :applicable_exclusive_redeemables_per_category_limit

    # Lists all exclusive categories. A redeemable from a campaign with an exclusive category is the only redeemable to be redeemed when applied with redeemables from other campaigns unless these campaigns are exclusive or joint.
    attr_accessor :exclusive_categories

    # Lists all joint categories. A campaign with a joint category is always applied regardless of the exclusivity of other campaigns.
    attr_accessor :joint_categories

    # Defines redeemables application mode.
    attr_accessor :redeemables_application_mode

    # Defines redeemables sorting rule.
    attr_accessor :redeemables_sorting_rule

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
        :'redeemables_limit' => :'redeemables_limit',
        :'applicable_redeemables_limit' => :'applicable_redeemables_limit',
        :'applicable_redeemables_per_category_limit' => :'applicable_redeemables_per_category_limit',
        :'applicable_exclusive_redeemables_limit' => :'applicable_exclusive_redeemables_limit',
        :'applicable_exclusive_redeemables_per_category_limit' => :'applicable_exclusive_redeemables_per_category_limit',
        :'exclusive_categories' => :'exclusive_categories',
        :'joint_categories' => :'joint_categories',
        :'redeemables_application_mode' => :'redeemables_application_mode',
        :'redeemables_sorting_rule' => :'redeemables_sorting_rule'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'redeemables_limit' => :'Integer',
        :'applicable_redeemables_limit' => :'Integer',
        :'applicable_redeemables_per_category_limit' => :'Integer',
        :'applicable_exclusive_redeemables_limit' => :'Integer',
        :'applicable_exclusive_redeemables_per_category_limit' => :'Integer',
        :'exclusive_categories' => :'Array<String>',
        :'joint_categories' => :'Array<String>',
        :'redeemables_application_mode' => :'String',
        :'redeemables_sorting_rule' => :'String'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `VoucherifySdk::StackingRules` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `VoucherifySdk::StackingRules`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'redeemables_limit')
        self.redeemables_limit = attributes[:'redeemables_limit']
      else
        self.redeemables_limit = 30
      end

      if attributes.key?(:'applicable_redeemables_limit')
        self.applicable_redeemables_limit = attributes[:'applicable_redeemables_limit']
      else
        self.applicable_redeemables_limit = 5
      end

      if attributes.key?(:'applicable_redeemables_per_category_limit')
        self.applicable_redeemables_per_category_limit = attributes[:'applicable_redeemables_per_category_limit']
      else
        self.applicable_redeemables_per_category_limit = 1
      end

      if attributes.key?(:'applicable_exclusive_redeemables_limit')
        self.applicable_exclusive_redeemables_limit = attributes[:'applicable_exclusive_redeemables_limit']
      else
        self.applicable_exclusive_redeemables_limit = 1
      end

      if attributes.key?(:'applicable_exclusive_redeemables_per_category_limit')
        self.applicable_exclusive_redeemables_per_category_limit = attributes[:'applicable_exclusive_redeemables_per_category_limit']
      else
        self.applicable_exclusive_redeemables_per_category_limit = 1
      end

      if attributes.key?(:'exclusive_categories')
        if (value = attributes[:'exclusive_categories']).is_a?(Array)
          self.exclusive_categories = value
        end
      else
        self.exclusive_categories = nil
      end

      if attributes.key?(:'joint_categories')
        if (value = attributes[:'joint_categories']).is_a?(Array)
          self.joint_categories = value
        end
      else
        self.joint_categories = nil
      end

      if attributes.key?(:'redeemables_application_mode')
        self.redeemables_application_mode = attributes[:'redeemables_application_mode']
      else
        self.redeemables_application_mode = nil
      end

      if attributes.key?(:'redeemables_sorting_rule')
        self.redeemables_sorting_rule = attributes[:'redeemables_sorting_rule']
      else
        self.redeemables_sorting_rule = 'REQUESTED_ORDER'
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      if @redeemables_limit.nil?
        invalid_properties.push('invalid value for "redeemables_limit", redeemables_limit cannot be nil.')
      end

      if @redeemables_limit > 30
        invalid_properties.push('invalid value for "redeemables_limit", must be smaller than or equal to 30.')
      end

      if @redeemables_limit < 1
        invalid_properties.push('invalid value for "redeemables_limit", must be greater than or equal to 1.')
      end

      if @applicable_redeemables_limit.nil?
        invalid_properties.push('invalid value for "applicable_redeemables_limit", applicable_redeemables_limit cannot be nil.')
      end

      if @applicable_redeemables_limit > 30
        invalid_properties.push('invalid value for "applicable_redeemables_limit", must be smaller than or equal to 30.')
      end

      if @applicable_redeemables_limit < 1
        invalid_properties.push('invalid value for "applicable_redeemables_limit", must be greater than or equal to 1.')
      end

      if !@applicable_redeemables_per_category_limit.nil? && @applicable_redeemables_per_category_limit > 5
        invalid_properties.push('invalid value for "applicable_redeemables_per_category_limit", must be smaller than or equal to 5.')
      end

      if !@applicable_redeemables_per_category_limit.nil? && @applicable_redeemables_per_category_limit < 1
        invalid_properties.push('invalid value for "applicable_redeemables_per_category_limit", must be greater than or equal to 1.')
      end

      if @applicable_exclusive_redeemables_limit.nil?
        invalid_properties.push('invalid value for "applicable_exclusive_redeemables_limit", applicable_exclusive_redeemables_limit cannot be nil.')
      end

      if @applicable_exclusive_redeemables_limit > 5
        invalid_properties.push('invalid value for "applicable_exclusive_redeemables_limit", must be smaller than or equal to 5.')
      end

      if @applicable_exclusive_redeemables_limit < 1
        invalid_properties.push('invalid value for "applicable_exclusive_redeemables_limit", must be greater than or equal to 1.')
      end

      if !@applicable_exclusive_redeemables_per_category_limit.nil? && @applicable_exclusive_redeemables_per_category_limit > 5
        invalid_properties.push('invalid value for "applicable_exclusive_redeemables_per_category_limit", must be smaller than or equal to 5.')
      end

      if !@applicable_exclusive_redeemables_per_category_limit.nil? && @applicable_exclusive_redeemables_per_category_limit < 1
        invalid_properties.push('invalid value for "applicable_exclusive_redeemables_per_category_limit", must be greater than or equal to 1.')
      end

      if @exclusive_categories.nil?
        invalid_properties.push('invalid value for "exclusive_categories", exclusive_categories cannot be nil.')
      end

      if @joint_categories.nil?
        invalid_properties.push('invalid value for "joint_categories", joint_categories cannot be nil.')
      end

      if @redeemables_application_mode.nil?
        invalid_properties.push('invalid value for "redeemables_application_mode", redeemables_application_mode cannot be nil.')
      end

      if @redeemables_sorting_rule.nil?
        invalid_properties.push('invalid value for "redeemables_sorting_rule", redeemables_sorting_rule cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      return false if @redeemables_limit.nil?
      return false if @redeemables_limit > 30
      return false if @redeemables_limit < 1
      return false if @applicable_redeemables_limit.nil?
      return false if @applicable_redeemables_limit > 30
      return false if @applicable_redeemables_limit < 1
      return false if !@applicable_redeemables_per_category_limit.nil? && @applicable_redeemables_per_category_limit > 5
      return false if !@applicable_redeemables_per_category_limit.nil? && @applicable_redeemables_per_category_limit < 1
      return false if @applicable_exclusive_redeemables_limit.nil?
      return false if @applicable_exclusive_redeemables_limit > 5
      return false if @applicable_exclusive_redeemables_limit < 1
      return false if !@applicable_exclusive_redeemables_per_category_limit.nil? && @applicable_exclusive_redeemables_per_category_limit > 5
      return false if !@applicable_exclusive_redeemables_per_category_limit.nil? && @applicable_exclusive_redeemables_per_category_limit < 1
      return false if @exclusive_categories.nil?
      return false if @joint_categories.nil?
      return false if @redeemables_application_mode.nil?
      redeemables_application_mode_validator = EnumAttributeValidator.new('String', ["ALL", "PARTIAL"])
      return false unless redeemables_application_mode_validator.valid?(@redeemables_application_mode)
      return false if @redeemables_sorting_rule.nil?
      redeemables_sorting_rule_validator = EnumAttributeValidator.new('String', ["CATEGORY_HIERARCHY", "REQUESTED_ORDER"])
      return false unless redeemables_sorting_rule_validator.valid?(@redeemables_sorting_rule)
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] redeemables_limit Value to be assigned
    def redeemables_limit=(redeemables_limit)
      if redeemables_limit.nil?
        fail ArgumentError, 'redeemables_limit cannot be nil'
      end

      if redeemables_limit > 30
        fail ArgumentError, 'invalid value for "redeemables_limit", must be smaller than or equal to 30.'
      end

      if redeemables_limit < 1
        fail ArgumentError, 'invalid value for "redeemables_limit", must be greater than or equal to 1.'
      end

      @redeemables_limit = redeemables_limit
    end

    # Custom attribute writer method with validation
    # @param [Object] applicable_redeemables_limit Value to be assigned
    def applicable_redeemables_limit=(applicable_redeemables_limit)
      if applicable_redeemables_limit.nil?
        fail ArgumentError, 'applicable_redeemables_limit cannot be nil'
      end

      if applicable_redeemables_limit > 30
        fail ArgumentError, 'invalid value for "applicable_redeemables_limit", must be smaller than or equal to 30.'
      end

      if applicable_redeemables_limit < 1
        fail ArgumentError, 'invalid value for "applicable_redeemables_limit", must be greater than or equal to 1.'
      end

      @applicable_redeemables_limit = applicable_redeemables_limit
    end

    # Custom attribute writer method with validation
    # @param [Object] applicable_redeemables_per_category_limit Value to be assigned
    def applicable_redeemables_per_category_limit=(applicable_redeemables_per_category_limit)
      if applicable_redeemables_per_category_limit.nil?
        fail ArgumentError, 'applicable_redeemables_per_category_limit cannot be nil'
      end

      if applicable_redeemables_per_category_limit > 5
        fail ArgumentError, 'invalid value for "applicable_redeemables_per_category_limit", must be smaller than or equal to 5.'
      end

      if applicable_redeemables_per_category_limit < 1
        fail ArgumentError, 'invalid value for "applicable_redeemables_per_category_limit", must be greater than or equal to 1.'
      end

      @applicable_redeemables_per_category_limit = applicable_redeemables_per_category_limit
    end

    # Custom attribute writer method with validation
    # @param [Object] applicable_exclusive_redeemables_limit Value to be assigned
    def applicable_exclusive_redeemables_limit=(applicable_exclusive_redeemables_limit)
      if applicable_exclusive_redeemables_limit.nil?
        fail ArgumentError, 'applicable_exclusive_redeemables_limit cannot be nil'
      end

      if applicable_exclusive_redeemables_limit > 5
        fail ArgumentError, 'invalid value for "applicable_exclusive_redeemables_limit", must be smaller than or equal to 5.'
      end

      if applicable_exclusive_redeemables_limit < 1
        fail ArgumentError, 'invalid value for "applicable_exclusive_redeemables_limit", must be greater than or equal to 1.'
      end

      @applicable_exclusive_redeemables_limit = applicable_exclusive_redeemables_limit
    end

    # Custom attribute writer method with validation
    # @param [Object] applicable_exclusive_redeemables_per_category_limit Value to be assigned
    def applicable_exclusive_redeemables_per_category_limit=(applicable_exclusive_redeemables_per_category_limit)
      if applicable_exclusive_redeemables_per_category_limit.nil?
        fail ArgumentError, 'applicable_exclusive_redeemables_per_category_limit cannot be nil'
      end

      if applicable_exclusive_redeemables_per_category_limit > 5
        fail ArgumentError, 'invalid value for "applicable_exclusive_redeemables_per_category_limit", must be smaller than or equal to 5.'
      end

      if applicable_exclusive_redeemables_per_category_limit < 1
        fail ArgumentError, 'invalid value for "applicable_exclusive_redeemables_per_category_limit", must be greater than or equal to 1.'
      end

      @applicable_exclusive_redeemables_per_category_limit = applicable_exclusive_redeemables_per_category_limit
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] redeemables_application_mode Object to be assigned
    def redeemables_application_mode=(redeemables_application_mode)
      validator = EnumAttributeValidator.new('String', ["ALL", "PARTIAL"])
      unless validator.valid?(redeemables_application_mode)
        fail ArgumentError, "invalid value for \"redeemables_application_mode\", must be one of #{validator.allowable_values}."
      end
      @redeemables_application_mode = redeemables_application_mode
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] redeemables_sorting_rule Object to be assigned
    def redeemables_sorting_rule=(redeemables_sorting_rule)
      validator = EnumAttributeValidator.new('String', ["CATEGORY_HIERARCHY", "REQUESTED_ORDER"])
      unless validator.valid?(redeemables_sorting_rule)
        fail ArgumentError, "invalid value for \"redeemables_sorting_rule\", must be one of #{validator.allowable_values}."
      end
      @redeemables_sorting_rule = redeemables_sorting_rule
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          redeemables_limit == o.redeemables_limit &&
          applicable_redeemables_limit == o.applicable_redeemables_limit &&
          applicable_redeemables_per_category_limit == o.applicable_redeemables_per_category_limit &&
          applicable_exclusive_redeemables_limit == o.applicable_exclusive_redeemables_limit &&
          applicable_exclusive_redeemables_per_category_limit == o.applicable_exclusive_redeemables_per_category_limit &&
          exclusive_categories == o.exclusive_categories &&
          joint_categories == o.joint_categories &&
          redeemables_application_mode == o.redeemables_application_mode &&
          redeemables_sorting_rule == o.redeemables_sorting_rule
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [redeemables_limit, applicable_redeemables_limit, applicable_redeemables_per_category_limit, applicable_exclusive_redeemables_limit, applicable_exclusive_redeemables_per_category_limit, exclusive_categories, joint_categories, redeemables_application_mode, redeemables_sorting_rule].hash
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
