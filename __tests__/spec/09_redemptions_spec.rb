require_relative '../lib/config.rb'
require_relative '../lib/voucherify_data.rb'
require_relative '../lib/stackables.rb'
require_relative 'support/snapshot_helper'
require_relative 'support/remove_keys_process'

RSpec.describe 'Redemptions API', :order => :defined do
  before(:each) do
    @redemptions_api_instance = Config.redemptions_api_instance()
    @voucherify_data = VoucherifyData.instance()
    @campaigns_api_instance = Config.campaigns_api_instance()
  end

  it 'redeem stacked discounts (applicable)', :order => :first do
    result = redeem_stacked_discounts(@redemptions_api_instance, @voucherify_data.get_voucher().code)

    snapshot_name = 'redemptions/redeem_stacked_applicable_discounts'
    keys_to_remove = [:id, :campaign_id, :campaign, :holder_id, :created_at, :updated_at, :date, :related_object_parent_id, :related_object_id, :stacked]
    filtered_snapshot, filtered_result = validate_payloads(snapshot_name, result, keys_to_remove)

    expect(result).not_to be_nil
    expect(filtered_snapshot).to eq(filtered_result)
  end

  it 'redeem stacked discounts (skipped)', :order => :second do
    vouchers = add_vouchers_to_campaign(@campaigns_api_instance, @voucherify_data.get_discount_campaign().id(), 30)

    result = redeem_stacked_discounts(@redemptions_api_instance, vouchers)

    snapshot_name = 'redemptions/redeem_stacked_skipped_discounts'
    keys_to_remove = [:id, :campaign_id, :campaign, :created_at, :updated_at, :date, :related_object_parent_id, :related_object_id, :stacked]
    filtered_snapshot, filtered_result = validate_payloads(snapshot_name, result, keys_to_remove)

    expect(result).not_to be_nil
    expect(filtered_snapshot).to eq(filtered_result)
  end
  

end