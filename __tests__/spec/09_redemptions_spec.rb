require_relative '../lib/config.rb'
require_relative '../lib/voucherify_data.rb'
require_relative '../lib/stackables.rb'
require_relative 'support/snapshot_helper'
require_relative 'support/spec_helper'
require_relative 'support/remove_keys_process'

RSpec.describe 'Redemptions API', :order => :defined do
  before(:each) do
    @redemptions_api_instance = Config.redemptions_api_instance()
    @voucherify_data = VoucherifyData.instance()
    @campaigns_api_instance = Config.campaigns_api_instance()
  end

  it 'redeem stacked discounts (applicable)', :order => :first do
    result = redeem_stacked_discounts(@redemptions_api_instance, @voucherify_data.get_voucher().code)
    result_cleaned = deep_transform_keys(result.to_hash) { |key| key.to_s } 

    snapshot_name = 'redemptions/redeem_stacked_applicable_discounts.json'
    snapshot = load_json(snapshot_name)
    snapshot_json = JSON.parse(snapshot)
    snapshot_hash = snapshot_json.to_hash

    snapshot_hash.each_key do |key|
      result_cleaned.to_json.should include_json(snapshot_hash[key].to_json)
    end

    p(snapshot_hash)
    p(snapshot_json)


    expect(result).not_to be_nil
  end


end
