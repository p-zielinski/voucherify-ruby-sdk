require_relative '../lib/order.rb'
require_relative '../lib/config.rb'
require_relative '../lib/voucherify_data.rb'

RSpec.describe 'Order API', :order => :defined do
  before(:each) do
    @order_api_instance = Config.order_api_instance()
    @voucherify_data = VoucherifyData.instance()
  end

  it 'should create order with status "created"', :order => :first do
    begin
      created_order = create_order(@order_api_instance)

      expect(created_order).not_to be_nil
      @voucherify_data.set_order(created_order)
    end
  end

  it 'should get previously order with status "created"', :order => :second do
    begin
      order = get_order(@order_api_instance, @voucherify_data.get_order().id)

      expect(order).not_to be_nil
    end
  end

  it 'should update previously order with status "created" to "paid"', :order => :third do
    begin
      updated_order = update_order(@order_api_instance, @voucherify_data.get_order().id)

      expect(updated_order).not_to be_nil
      @voucherify_data.set_order(updated_order)
    end
  end

  it 'should list first 10 orders', :order => :fourth do
    begin
      orders = list_orders(@order_api_instance)

      expect(orders).not_to be_nil
    end
  end
end