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
  class ExportOrderFields
    ID = "id".freeze
    SOURCE_ID = "source_id".freeze
    CREATED_AT = "created_at".freeze
    UPDATED_AT = "updated_at".freeze
    STATUS = "status".freeze
    AMOUNT = "amount".freeze
    DISCOUNT_AMOUNT = "discount_amount".freeze
    ITEMS_DISCOUNT_AMOUNT = "items_discount_amount".freeze
    TOTAL_DISCOUNT_AMOUNT = "total_discount_amount".freeze
    TOTAL_AMOUNT = "total_amount".freeze
    CUSTOMER_ID = "customer_id".freeze
    REFERRER_ID = "referrer_id".freeze
    METADATA = "metadata".freeze

    def self.all_vars
      @all_vars ||= [ID, SOURCE_ID, CREATED_AT, UPDATED_AT, STATUS, AMOUNT, DISCOUNT_AMOUNT, ITEMS_DISCOUNT_AMOUNT, TOTAL_DISCOUNT_AMOUNT, TOTAL_AMOUNT, CUSTOMER_ID, REFERRER_ID, METADATA].freeze
    end

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def self.build_from_hash(value)
      new.build_from_hash(value)
    end

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      return value if ExportOrderFields.all_vars.include?(value)
      raise "Invalid ENUM value #{value} for class #ExportOrderFields"
    end
  end
end