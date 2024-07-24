require_relative '../lib/config.rb'
require_relative '../lib/voucherify_data.rb'
require_relative '../lib/events.rb'
require_relative 'support/snapshot_helper'
require_relative 'support/remove_keys_process'

RSpec.describe 'Events API', :order => :defined do
  before(:each) do
    @events_api_instance = Config.events_api_instance()
    @voucherify_data = VoucherifyData.instance()
  end

  it 'track custom event', :order => :first do
    created_event = create_event(@events_api_instance)

    snapshot_name = 'events/created_event'
    keys_to_remove = ['id', 'source_id']
    filtered_snapshot, filtered_result = validate_payloads(snapshot_name, created_event, keys_to_remove)

    expect(created_event).not_to be_nil
    expect(filtered_snapshot).to eq(filtered_result)
  end
end