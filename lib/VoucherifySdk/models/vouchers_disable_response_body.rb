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
  # Response body schema for **POST** `/vouchers/{code}/disable`.
  class VouchersDisableResponseBody
    # Assigned by the Voucherify API, identifies the voucher.
    attr_accessor :id

    # A code that identifies a voucher. Pattern can use all letters of the English alphabet, Arabic numerals, and special characters.
    attr_accessor :code

    # A unique campaign name, identifies the voucher's parent campaign.
    attr_accessor :campaign

    # Assigned by the Voucherify API, identifies the voucher's parent campaign.
    attr_accessor :campaign_id

    # Tag defining the category that this voucher belongs to. Useful when listing vouchers using the List Vouchers endpoint.
    attr_accessor :category

    # Unique category ID assigned by Voucherify.
    attr_accessor :category_id

    # Contains details about the category.
    attr_accessor :categories

    # Defines the type of the voucher. 
    attr_accessor :type

    attr_accessor :discount

    attr_accessor :gift

    attr_accessor :loyalty_card

    # Activation timestamp defines when the code starts to be active in ISO 8601 format. Voucher is *inactive before* this date. 
    attr_accessor :start_date

    # Expiration timestamp defines when the code expires in ISO 8601 format.  Voucher is *inactive after* this date.
    attr_accessor :expiration_date

    attr_accessor :validity_timeframe

    # Integer array corresponding to the particular days of the week in which the voucher is valid.  - `0` Sunday - `1` Monday - `2` Tuesday - `3` Wednesday - `4` Thursday - `5` Friday - `6` Saturday
    attr_accessor :validity_day_of_week

    attr_accessor :validity_hours

    # A flag to toggle the voucher on or off. You can disable a voucher even though it's within the active period defined by the `start_date` and `expiration_date`.    - `true` indicates an *active* voucher - `false` indicates an *inactive* voucher
    attr_accessor :active

    # An optional field to keep any extra textual information about the code such as a code description and details.
    attr_accessor :additional_info

    # The metadata object stores all custom attributes assigned to the code. A set of key/value pairs that you can attach to a voucher object. It can be useful for storing additional information about the voucher in a structured format.
    attr_accessor :metadata

    attr_accessor :assets

    # Flag indicating whether this voucher is a referral code; `true` for campaign type `REFERRAL_PROGRAM`.
    attr_accessor :is_referral_code

    # Timestamp representing the date and time when the voucher was created. The value is shown in the ISO 8601 format.
    attr_accessor :created_at

    # Timestamp representing the date and time when the voucher was last updated in ISO 8601 format.
    attr_accessor :updated_at

    # Unique identifier of the customer who owns the voucher.
    attr_accessor :holder_id

    # Unique identifier of the referring person.
    attr_accessor :referrer_id

    # The type of the object represented by JSON. Default is `voucher`.
    attr_accessor :object

    attr_accessor :validation_rules_assignments

    attr_accessor :publish

    attr_accessor :redemption

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
        :'code' => :'code',
        :'campaign' => :'campaign',
        :'campaign_id' => :'campaign_id',
        :'category' => :'category',
        :'category_id' => :'category_id',
        :'categories' => :'categories',
        :'type' => :'type',
        :'discount' => :'discount',
        :'gift' => :'gift',
        :'loyalty_card' => :'loyalty_card',
        :'start_date' => :'start_date',
        :'expiration_date' => :'expiration_date',
        :'validity_timeframe' => :'validity_timeframe',
        :'validity_day_of_week' => :'validity_day_of_week',
        :'validity_hours' => :'validity_hours',
        :'active' => :'active',
        :'additional_info' => :'additional_info',
        :'metadata' => :'metadata',
        :'assets' => :'assets',
        :'is_referral_code' => :'is_referral_code',
        :'created_at' => :'created_at',
        :'updated_at' => :'updated_at',
        :'holder_id' => :'holder_id',
        :'referrer_id' => :'referrer_id',
        :'object' => :'object',
        :'validation_rules_assignments' => :'validation_rules_assignments',
        :'publish' => :'publish',
        :'redemption' => :'redemption'
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
        :'code' => :'String',
        :'campaign' => :'String',
        :'campaign_id' => :'String',
        :'category' => :'String',
        :'category_id' => :'String',
        :'categories' => :'Array<Category>',
        :'type' => :'String',
        :'discount' => :'Discount',
        :'gift' => :'VoucherGift',
        :'loyalty_card' => :'VoucherLoyaltyCard',
        :'start_date' => :'Time',
        :'expiration_date' => :'Time',
        :'validity_timeframe' => :'VoucherValidityTimeframe',
        :'validity_day_of_week' => :'Array<Integer>',
        :'validity_hours' => :'ValidityHours',
        :'active' => :'Boolean',
        :'additional_info' => :'String',
        :'metadata' => :'Object',
        :'assets' => :'VoucherAssets',
        :'is_referral_code' => :'Boolean',
        :'created_at' => :'Time',
        :'updated_at' => :'Time',
        :'holder_id' => :'String',
        :'referrer_id' => :'String',
        :'object' => :'String',
        :'validation_rules_assignments' => :'ValidationRulesAssignmentsList',
        :'publish' => :'VoucherPublish',
        :'redemption' => :'VoucherRedemption'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'active',
        :'is_referral_code',
      ])
    end

    # List of class defined in allOf (OpenAPI v3)
    def self.openapi_all_of
      [
      :'Voucher'
      ]
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `VoucherifySdk::VouchersDisableResponseBody` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `VoucherifySdk::VouchersDisableResponseBody`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.key?(:'code')
        self.code = attributes[:'code']
      end

      if attributes.key?(:'campaign')
        self.campaign = attributes[:'campaign']
      end

      if attributes.key?(:'campaign_id')
        self.campaign_id = attributes[:'campaign_id']
      end

      if attributes.key?(:'category')
        self.category = attributes[:'category']
      end

      if attributes.key?(:'category_id')
        self.category_id = attributes[:'category_id']
      end

      if attributes.key?(:'categories')
        if (value = attributes[:'categories']).is_a?(Array)
          self.categories = value
        end
      end

      if attributes.key?(:'type')
        self.type = attributes[:'type']
      end

      if attributes.key?(:'discount')
        self.discount = attributes[:'discount']
      end

      if attributes.key?(:'gift')
        self.gift = attributes[:'gift']
      end

      if attributes.key?(:'loyalty_card')
        self.loyalty_card = attributes[:'loyalty_card']
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

      if attributes.key?(:'additional_info')
        self.additional_info = attributes[:'additional_info']
      end

      if attributes.key?(:'metadata')
        self.metadata = attributes[:'metadata']
      end

      if attributes.key?(:'assets')
        self.assets = attributes[:'assets']
      end

      if attributes.key?(:'is_referral_code')
        self.is_referral_code = attributes[:'is_referral_code']
      end

      if attributes.key?(:'created_at')
        self.created_at = attributes[:'created_at']
      end

      if attributes.key?(:'updated_at')
        self.updated_at = attributes[:'updated_at']
      end

      if attributes.key?(:'holder_id')
        self.holder_id = attributes[:'holder_id']
      end

      if attributes.key?(:'referrer_id')
        self.referrer_id = attributes[:'referrer_id']
      end

      if attributes.key?(:'object')
        self.object = attributes[:'object']
      else
        self.object = 'voucher'
      end

      if attributes.key?(:'validation_rules_assignments')
        self.validation_rules_assignments = attributes[:'validation_rules_assignments']
      end

      if attributes.key?(:'publish')
        self.publish = attributes[:'publish']
      end

      if attributes.key?(:'redemption')
        self.redemption = attributes[:'redemption']
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
      type_validator = EnumAttributeValidator.new('String', ["GIFT_VOUCHER", "DISCOUNT_VOUCHER", "LOYALTY_CARD"])
      return false unless type_validator.valid?(@type)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      validator = EnumAttributeValidator.new('String', ["GIFT_VOUCHER", "DISCOUNT_VOUCHER", "LOYALTY_CARD"])
      unless validator.valid?(type)
        fail ArgumentError, "invalid value for \"type\", must be one of #{validator.allowable_values}."
      end
      @type = type
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          code == o.code &&
          campaign == o.campaign &&
          campaign_id == o.campaign_id &&
          category == o.category &&
          category_id == o.category_id &&
          categories == o.categories &&
          type == o.type &&
          discount == o.discount &&
          gift == o.gift &&
          loyalty_card == o.loyalty_card &&
          start_date == o.start_date &&
          expiration_date == o.expiration_date &&
          validity_timeframe == o.validity_timeframe &&
          validity_day_of_week == o.validity_day_of_week &&
          validity_hours == o.validity_hours &&
          active == o.active &&
          additional_info == o.additional_info &&
          metadata == o.metadata &&
          assets == o.assets &&
          is_referral_code == o.is_referral_code &&
          created_at == o.created_at &&
          updated_at == o.updated_at &&
          holder_id == o.holder_id &&
          referrer_id == o.referrer_id &&
          object == o.object &&
          validation_rules_assignments == o.validation_rules_assignments &&
          publish == o.publish &&
          redemption == o.redemption
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [id, code, campaign, campaign_id, category, category_id, categories, type, discount, gift, loyalty_card, start_date, expiration_date, validity_timeframe, validity_day_of_week, validity_hours, active, additional_info, metadata, assets, is_referral_code, created_at, updated_at, holder_id, referrer_id, object, validation_rules_assignments, publish, redemption].hash
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
