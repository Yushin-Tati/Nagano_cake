class Customers::OrdersController < Customers::ApplicationController

  def index
    @orders = current_customer.orders.order(id: "DESC")
    @order_details = OrderDetail.all
  end

  def new
    @customer = Customer.find(current_customer.id)
    @order = Order.new
    @customer_shipping_addresses = Address.where(customer_id: current_customer.id)
  end

  def confirm
    @customer = Customer.find(current_customer.id)
    @cart_items = current_customer.cart_items
    @order = Order.new
    @shipping_cost = 800
    @cart_items = current_customer.cart_items
    @@selected = params[:select].to_i
    case @@selected
    when 0
      @postal_code = params[:postal_code]
      @address = params[:address]
      @name = @customer.last_name + @customer.first_name
    when 1
      address_id = params[:shipping_address]
      address = Address.find(id: address_id)
      @postal_code = address.postal_code
      @address = address.address
      @name = address.name
    when 2
      @postal_code = params[:p]
      @address = params[:a]
      @name = params[:n]
    end
  end


  def create
    order = Order.new(order_params)
    cart_items = current_customer.cart_items
    if order.save
      cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.order_id = order.id
        order_detail.item_id = cart_item.item_id
        order_detail.price = cart_item.item.price * cart_item.amount
        order_detail.amount = cart_item.amount
        order_detail.status = 0

        order_detail.save
      end
      if @@selected == 2
        address = Address.new
        address.customer_id = current_customer.id
        address.name = order.name
        address.postal_code = order.postal_code
        address.address = order.address

        address.save
      end
      redirect_to orders_complete_path
    else
      @customer = current_customer
      @customer_shipping_addresses = @customer.addresses
      render :new
    end

  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :status, :postal_code, :name, :address, :shipping_cost, :payment_method, :total_payment)
  end


end
