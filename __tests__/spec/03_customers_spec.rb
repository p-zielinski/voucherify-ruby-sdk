require_relative '../lib/customers.rb'
require_relative '../lib/config.rb'
require_relative '../lib/voucherify_data.rb'
require_relative 'support/snapshot_helper'
require_relative 'support/remove_keys_process'

RSpec.describe 'Customers API', :order => :defined do
  before(:each) do
    @customers_api_instance = Config.customers_api_instance()
    @voucherify_data = VoucherifyData.instance()
  end

  it 'create a customer', :order => :first do
    created_customer = create_customer(@customers_api_instance)

    snapshot_name = 'customers/created_customer'
    keys_to_remove = ['id', 'source_id', 'created_at']
    filtered_snapshot, filtered_result = validate_payloads(snapshot_name, created_customer, keys_to_remove)

    expect(created_customer).not_to be_nil
    expect(filtered_snapshot).to eq(filtered_result)
    @voucherify_data.set_customer(created_customer)
  end

  it 'create a customer and delete it', :order => :second do
    created_customer = create_customer(@customers_api_instance)
    deleted_customer = delete_customer_permanently(@customers_api_instance, created_customer.id)

    created_customer_snapshot = 'customers/created_customer'
    deleted_customer_snapshot = 'customers/deleted_customer'
    keys_to_remove = ['id', 'source_id', 'created_at', 'related_object_id']
    filtered_snapshot, filtered_result = validate_payloads(created_customer_snapshot, created_customer, keys_to_remove)
    filtered_snapshot_2, filtered_result_2 = validate_payloads(deleted_customer_snapshot, deleted_customer, keys_to_remove)
    
    expect(created_customer).not_to be_nil
    expect(created_customer).not_to be_nil
    expect(filtered_snapshot).to eq(filtered_result)
    expect(filtered_snapshot_2).to eq(filtered_result_2)
  end
end
