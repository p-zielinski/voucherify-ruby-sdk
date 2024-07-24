require_relative '../lib/config.rb'
require_relative 'support/snapshot_helper'
require_relative 'support/remove_keys_process'

RSpec.describe 'Publications API', :order => :defined do
  before(:each) do
    @publications_api_instance = Config.publications_api_instance()
    @voucherify_data = VoucherifyData.instance()
  end

  it 'create a publication', :order => :first do
    publication = @publications_api_instance.create_publication({
        join_once: true,
        publications_create_request_body: VoucherifySdk::PublicationsCreateRequestBody.new({
          customer: VoucherifySdk::Customer.new({
            id: @voucherify_data.get_customer().id
          }),
          campaign: VoucherifySdk::CreatePublicationCampaign.new({
              name: @voucherify_data.get_discount_campaign().name
            })
          })
      })

    snapshot_name = 'publications/created_publication'
    keys_to_remove = ['id', 'created_at', 'customer_id', 'tracking_id', 'source_id', 'campaign_id', 'url', 'updated_at', 'holder_id', 'vouchers_id', 'campaign', 'code']
    filtered_snapshot, filtered_result = validate_payloads(snapshot_name, publication, keys_to_remove)

    expect(publication).not_to be_nil
    expect(filtered_snapshot).to eq(filtered_result)
  end
end
