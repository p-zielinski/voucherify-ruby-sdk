require_relative '../lib/config.rb'
require_relative '../lib/voucherify_data.rb'
require_relative 'support/snapshot_helper'
require_relative 'support/remove_keys_process'

RSpec.describe 'Qualifications API', :order => :defined do
  before(:each) do
    @qualifications_api_instance = Config.qualifications_api_instance()
    @voucherify_data = VoucherifyData.instance()
  end

  it 'check eligibility', :order => :first do
    result = @qualifications_api_instance.check_eligibility({
        qualifications_check_eligibility_request_body: VoucherifySdk::QualificationsCheckEligibilityRequestBody.new({
            customer: VoucherifySdk::Customer.new({
                id: @voucherify_data.get_customer().id
            }),
            order: VoucherifySdk::Order.new({
                amount: 20000,
            }),
            options: VoucherifySdk::QualificationsOption.new({
                limit: 100
            })
        })
    })

    snapshot_name = 'qualifications/checked_eligibility'
    keys_to_remove = ['id', 'created_at', 'tracking_id', 'more_starting_after', 'redeemables']
    filtered_snapshot, filtered_result = validate_payloads(snapshot_name, result, keys_to_remove)

    expect(result).not_to be_nil
    expect(filtered_snapshot).to eq(filtered_result)
  end
end