require_relative '../lib/loyalties.rb'
require_relative '../lib/config.rb'
require_relative '../lib/voucherify_data.rb'
require_relative 'support/snapshot_helper'
require_relative 'support/remove_keys_process'

RSpec.describe 'Loyalties API', :order => :defined do
  before(:each) do
    @loyalties_api_instance = Config.loyalties_api_instance()
    @voucherify_data = VoucherifyData.instance()
    @campaigns_api_instance = Config.campaigns_api_instance()
  end

  it 'should update loyalty member balance by 1000 points', :order => :first do
    begin
      loyalty_card = @voucherify_data.get_loyalty_card()
      updated_loyalty_member_card = update_loyalty_card_balance(@loyalties_api_instance, loyalty_card.code)

      snapshot_name = 'loyalties/updated_loyalty_member_card'
      keys_to_remove = ['id']
      filtered_snapshot, filtered_result = validate_payloads(snapshot_name, updated_loyalty_member_card, keys_to_remove)

      expect(updated_loyalty_member_card).not_to be_nil
      expect(filtered_snapshot).to eq(filtered_result)
    end
  end

  it 'should return list of member loyalty tansactions', :order => :second do
    begin
      loyalty_card = @voucherify_data.get_loyalty_card()
      transactions = list_loyalty_card_transactions(@loyalties_api_instance, loyalty_card.code)

      snapshot_name = 'loyalties/member_transactions'
      keys_to_remove = ['id', 'voucher_id', 'campaign_id', 'created_at', 'source_id']
      filtered_snapshot, filtered_result = validate_payloads(snapshot_name, transactions, keys_to_remove)

      expect(transactions).not_to be_nil
      expect(filtered_snapshot).to eq(filtered_result)
    end
  end
end
