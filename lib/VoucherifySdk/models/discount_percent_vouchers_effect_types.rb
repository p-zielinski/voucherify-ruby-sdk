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
  class DiscountPercentVouchersEffectTypes
    ORDER = "APPLY_TO_ORDER".freeze
    ITEMS = "APPLY_TO_ITEMS".freeze

    def self.all_vars
      @all_vars ||= [ORDER, ITEMS].freeze
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
      return value if DiscountPercentVouchersEffectTypes.all_vars.include?(value)
      raise "Invalid ENUM value #{value} for class #DiscountPercentVouchersEffectTypes"
    end
  end
end