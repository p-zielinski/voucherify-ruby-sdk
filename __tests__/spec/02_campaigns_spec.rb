require_relative '../lib/campaigns.rb'
require_relative '../lib/config.rb'
require_relative '../lib/voucherify_data.rb'
require_relative 'support/snapshot_helper'
require_relative 'support/remove_keys_process'

RSpec.describe 'Campaigns API', :order => :defined do
  before(:each) do
    @campaigns_api_instance = Config.campaigns_api_instance()
    @validation_rules_api_instance = Config.validation_rules_api_instance()
    @voucherify_data = VoucherifyData.instance()
  end

  $created_validation_rule = nil
  $created_discount_campaign = nil
  $created_promotion_campaign = nil
  $created_loyalty_campaign = nil
  $created_validation_rule_applicable_to = nil

  it 'create a validation rule with applicable_to', :order => :first do
    validation_rule = create_validation_rule_applicable_to(@validation_rules_api_instance, @voucherify_data.get_product.id)

    snapshot_name = 'campaigns/created_validation_rule_applicable_to'
    keys_to_remove = ['id', 'created_at', 'name']
    filtered_snapshot, filtered_result = validate_payloads(snapshot_name, validation_rule, keys_to_remove)

    expect(validation_rule).not_to be_nil
    expect(filtered_snapshot).to eq(filtered_result)

    $created_validation_rule_applicable_to = validation_rule
    @voucherify_data.set_validation_rule(validation_rule)
  end

  it 'create a discount campaign with applicable_to validation rule', :order => :second do
    created_discount_campaign = create_discount_campaign(@campaigns_api_instance, $created_validation_rule_applicable_to.id)

    snapshot_name = 'campaigns/created_discount_campaign'
    keys_to_remove = ['id', 'created_at', 'name', 'rule_id', 'related_object_id']
    filtered_snapshot, filtered_result = validate_payloads(snapshot_name, created_discount_campaign, keys_to_remove)

    expect(created_discount_campaign).not_to be_nil
    expect(filtered_snapshot).to eq(filtered_result)

    $created_discount_campaign = created_discount_campaign
    @voucherify_data.set_discount_campaign(created_discount_campaign)
  end

  it 'create a promotion campaign', :order => :thrid do
    created_promotion_campaign = create_promotion_campaign(@campaigns_api_instance)

    snapshot_name = 'campaigns/created_promotion_campaign'
    keys_to_remove = ['id', 'created_at', 'name', 'rule_id', 'related_object_id', 'banner', 'promotion_id', 'campaign_id']
    filtered_snapshot, filtered_result = validate_payloads(snapshot_name, created_promotion_campaign, keys_to_remove)

    expect(created_promotion_campaign).not_to be_nil
    expect(filtered_snapshot).to eq(filtered_result)

    $created_promotion_campaign = created_promotion_campaign
  end

  it 'create a loyalty campaign', :order => :fourth do
    created_loyalty_campaign = create_loyalty_campaign(@campaigns_api_instance)

    snapshot_name = 'campaigns/created_loyalty_campaign'
    keys_to_remove = ['id', 'created_at', 'name']
    filtered_snapshot, filtered_result = validate_payloads(snapshot_name, created_loyalty_campaign, keys_to_remove)

    expect(created_loyalty_campaign).not_to be_nil
    expect(filtered_snapshot).to eq(filtered_result)

    $created_loyalty_campaign = created_loyalty_campaign
    @voucherify_data.set_loyalty_campaign(created_loyalty_campaign)
  end

  it 'delete the promotion campaign', :order => :fifth do
    deleted_promotion_campaign = delete_campaign(@campaigns_api_instance, $created_promotion_campaign.id)

    expect(deleted_promotion_campaign).not_to be_nil
  end

  it 'add voucher to campaign', :order => :sixth do
    created_voucher = @campaigns_api_instance.add_vouchers_to_campaign($created_discount_campaign.id, {
        vouchers_count: 1,
    })

    snapshot_name = 'campaigns/added_voucher_to_campaign'
    keys_to_remove = ['id','code', 'campaign', 'campaign_id', 'url', 'created_at', 'rule_id', 'related_object_id']
    filtered_snapshot, filtered_result = validate_payloads(snapshot_name, created_voucher, keys_to_remove)

    @voucherify_data.set_voucher(created_voucher)

    expect(created_voucher).not_to be_nil
    expect(filtered_snapshot).to eq(filtered_result)
  end

  it 'create a bundle of vouchers', :order => :seventh do
    async_action = @campaigns_api_instance.add_vouchers_to_campaign($created_discount_campaign.id, {
        vouchers_count: 5,
    })

    expect(async_action).not_to be_nil
  end

  it 'add loyalty card to campaign', :order => :eighth do
    created_loyalty_card = @campaigns_api_instance.add_vouchers_to_campaign($created_loyalty_campaign.id, {
        vouchers_count: 1,
    })

    snapshot_name = 'campaigns/added_loyalty_card_to_campaign'
    keys_to_remove = ['id','code', 'campaign', 'campaign_id', 'url', 'created_at']
    filtered_snapshot, filtered_result = validate_payloads(snapshot_name, created_loyalty_card, keys_to_remove)

    @voucherify_data.set_loyalty_card(created_loyalty_card)
    expect(created_loyalty_card).not_to be_nil
    expect(filtered_snapshot).to eq(filtered_result)
  end

  it 'create a campaign with validation rule and add voucher', :order => :ninth do
    validation_rule = create_validation_rule_more_than(@validation_rules_api_instance, @voucherify_data.get_product.id)
    campaign = create_discount_campaign(@campaigns_api_instance, validation_rule.id)

    validation_rule_snapshot = 'campaigns/created_validation_rule_more_than'
    campaign_snapshot = 'campaigns/created_discount_campaign_with_val_rule'
    keys_to_remove = ['name', 'id', 'created_at', 'rule_id', 'related_object_id']
    filtered_snapshot, filtered_result = validate_payloads(validation_rule_snapshot, validation_rule, keys_to_remove)
    filtered_snapshot_2, filtered_result_2 = validate_payloads(campaign_snapshot, campaign, keys_to_remove)

    expect(validation_rule).not_to be_nil
    expect(campaign).not_to be_nil
    expect(filtered_snapshot).to eq(filtered_result)
    expect(filtered_snapshot_2).to eq(filtered_result_2)

    voucher = @campaigns_api_instance.add_vouchers_to_campaign(campaign.id, {
        vouchers_count: 1,
    })

    @voucherify_data.set_voucher_with_more_than_validation_rule(voucher)
  end
end
