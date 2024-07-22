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

    snapshot_name = 'redemptions/redeem_stacked_applicable_discounts.json'
    snapshot = load_json(snapshot_name)

    result.to_json.should include_json(JSON.parse(snapshot).to_json)

    expect(result).not_to be_nil
  end


end
