require_relative '../lib/products.rb'
require_relative '../lib/config.rb'
require_relative '../lib/voucherify_data.rb'
require_relative 'support/snapshot_helper'
require_relative 'support/remove_keys_process'

RSpec.describe 'Products API', :order => :defined do
  before(:each) do
    @products_api_instance = Config.products_api_instance()
    @voucherify_data = VoucherifyData.instance()

  end

  it 'creates a product with price 20000 and price 60000', :order => :first do
    created_product = create_product(@products_api_instance, 20000)
    
    
    @voucherify_data.set_product(created_product)
    @voucherify_data.add_product_id(created_product.source_id)
    
    created_product_2 = create_product(@products_api_instance, 60000)

    snapshot_name = 'products/created_product'
    snapshot_name2 = 'products/created_product2'
    keys_to_remove = ['id', 'source_id', 'created_at', 'name']
    filtered_snapshot, filtered_result = validate_payloads(snapshot_name, created_product, keys_to_remove)
    filtered_snapshot_2, filtered_result_2 = validate_payloads(snapshot_name2, created_product_2, keys_to_remove)

    @voucherify_data.add_product_id(created_product_2.source_id)

    expect(created_product).not_to be_nil
    expect(created_product_2).not_to be_nil
    expect(filtered_snapshot).to eq(filtered_result)
    expect(filtered_snapshot_2).to eq(filtered_result_2)
  end

  it 'get product previously created', :order => :second do
    product = @products_api_instance.get_product(@voucherify_data.get_product().source_id)

    snapshot_name = 'products/get_previously_created_product'
    keys_to_remove = ['id', 'source_id', 'created_at', 'name']
    filtered_snapshot, filtered_result = validate_payloads(snapshot_name, product, keys_to_remove)

    expect(product).not_to be_nil
    expect(product.price).to eq(20000)
    expect(filtered_snapshot).to eq(filtered_result)
  end

  it 'update price of created product to 55000 using source_id for founding product', :order => :third do
    updated_product = update_product(@products_api_instance, @voucherify_data.get_product().source_id)

    snapshot_name = 'products/updated_product_price'
    keys_to_remove = ['id', 'source_id', 'created_at', 'name', 'updated_at']
    filtered_snapshot, filtered_result = validate_payloads(snapshot_name, updated_product, keys_to_remove)

    expect(updated_product).not_to be_nil
    expect(updated_product.price).to eq(55000)
    expect(filtered_snapshot).to eq(filtered_result)
  end

  it 'list products', :order => :fourth do
    products = @products_api_instance.list_products()

    expect(products).not_to be_nil
    expect(products.products.size).to be > 0
  end

  it 'update products in bulk', :order => :fifth do
    async_action = update_product_in_bulk(@products_api_instance)
    expect(async_action).not_to be_nil
  end

  it 'update metadata in bulk', :order => :sixth do
    async_action = update_metadata_in_bulk(@products_api_instance, @voucherify_data.get_product_ids())

    expect(async_action).not_to be_nil
  end

  it 'add sku to product with price 5000', :order => :seventh do
    sku = create_sku(@products_api_instance, @voucherify_data.get_product().source_id, 5000)

    snapshot_name = 'products/added_sku_to_product'
    keys_to_remove = ['id', 'source_id', 'product_id', 'created_at']
    filtered_snapshot, filtered_result = validate_payloads(snapshot_name, sku, keys_to_remove)

    expect(sku).not_to be_nil
    expect(sku.source_id).not_to be_nil
    expect(sku.price).to eq(5000)
    expect(filtered_snapshot).to eq(filtered_result)

    @voucherify_data.set_sku(sku)
  end

  it 'update sku should have price equals 2000', :order => :eighth do
    sku = update_sku(@products_api_instance, @voucherify_data.get_product().source_id, @voucherify_data.get_sku().source_id, 2000)

    snapshot_name = 'products/updated_product_sku'
    keys_to_remove = ['id', 'source_id', 'product_id', 'created_at', 'updated_at']
    filtered_snapshot, filtered_result = validate_payloads(snapshot_name, sku, keys_to_remove)

    expect(sku).not_to be_nil
    expect(sku.source_id).not_to be_nil
    expect(sku.price).to eq(2000)
    expect(filtered_snapshot).to eq(filtered_result)
  end

  it 'get sku', :order => :ninth do
    sku = @products_api_instance.get_sku(@voucherify_data.get_sku().source_id)

    snapshot_name = 'products/get_product_sku'
    keys_to_remove = ['id', 'source_id', 'product_id', 'created_at', 'updated_at']
    filtered_snapshot, filtered_result = validate_payloads(snapshot_name, sku, keys_to_remove)

    expect(sku).not_to be_nil
    expect(filtered_snapshot).to eq(filtered_result)
  end

  it 'list skus in product', :order => :tenth do
    skus = @products_api_instance.list_skus_in_product(@voucherify_data.get_product().source_id)

    snapshot_name = 'products/list_skus'
    keys_to_remove = ['id', 'source_id', 'product_id', 'created_at', 'updated_at']
    filtered_snapshot, filtered_result = validate_payloads(snapshot_name, skus, keys_to_remove)

    expect(skus).not_to be_nil
    expect(skus.skus.size).to be > 0
    expect(filtered_snapshot).to eq(filtered_result)
  end

  #REMOVE ELEMENTS
  it 'remove product', :order => :eleventh do
    deleted_product = delete_product(@products_api_instance, @voucherify_data.get_product().source_id)

    expect(deleted_product).to be_nil
  end 

  it 'remove sku', :order => :twelweth do
    deleted_sku = delete_sku(@products_api_instance, @voucherify_data.get_product().source_id, @voucherify_data.get_sku().source_id)

    expect(deleted_sku).to be_nil
  end
end
