require_relative '../lib/config.rb'
require_relative '../lib/voucherify_data.rb'
require 'VoucherifySdk'
require_relative 'support/snapshot_helper'
require_relative 'support/remove_keys_process'

RSpec.describe 'Vouchers API', :order => :defined do
  before(:each) do
    @vouchers_api_instance = Config.vouchers_api_instance()
    @voucherify_data = VoucherifyData.instance()
  end

  it 'get voucher previously created', :order => :first do
    voucher = @vouchers_api_instance.get_voucher(@voucherify_data.get_voucher().code)

    snapshot_name = 'vouchers/get_previously_created_voucher'
    keys_to_remove = ['id', 'code', 'campaign', 'campaign_id', 'url', 'created_at', 'updated_at', 'holder_id', 'rule_id', 'related_object_id']
    filtered_snapshot, filtered_result = validate_payloads(snapshot_name, voucher, keys_to_remove)

    expect(voucher).not_to be_nil
    expect(filtered_snapshot).to eq(filtered_result)
  end

  it 'disable voucher previously created', :order => :second do
    voucher = @vouchers_api_instance.disable_voucher(@voucherify_data.get_voucher().code)

    snapshot_name = 'vouchers/disabled_previously_created_voucher'
    keys_to_remove = ['id', 'code', 'campaign', 'campaign_id', 'url', 'created_at', 'updated_at', 'holder_id', 'rule_id', 'related_object_id']
    filtered_snapshot, filtered_result = validate_payloads(snapshot_name, voucher, keys_to_remove)

    expect(voucher).not_to be_nil
    expect(filtered_snapshot).to eq(filtered_result)
  end

  it 'enable voucher previously created', :order => :thrird do
    voucher = @vouchers_api_instance.enable_voucher(@voucherify_data.get_voucher().code)

    snapshot_name = 'vouchers/enabled_previously_created_voucher'
    keys_to_remove = ['id', 'code', 'campaign', 'campaign_id', 'url', 'created_at', 'updated_at', 'holder_id', 'rule_id', 'related_object_id']
    filtered_snapshot, filtered_result = validate_payloads(snapshot_name, voucher, keys_to_remove)

    expect(voucher).not_to be_nil
    expect(filtered_snapshot).to eq(filtered_result)
  end

  it 'update loyalty card balance', :order => :fourth do
    vouchers_balance_update_request_body = VoucherifySdk::VouchersBalanceUpdateRequestBody.new({
        source_id: generate_random_string(),
        amount: 10000,
        reason: "Regular customer"
      })
    
    response = @vouchers_api_instance.update_voucher_balance(@voucherify_data.get_loyalty_card().code, vouchers_balance_update_request_body)

    snapshot_name = 'vouchers/updated_loyalty_card_balance'
    keys_to_remove = ['id']
    filtered_snapshot, filtered_result = validate_payloads(snapshot_name, response, keys_to_remove)

    expect(response).not_to be_nil
    expect(filtered_snapshot).to eq(filtered_result)
  end
end