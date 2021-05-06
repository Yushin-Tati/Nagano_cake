class Admins::OrdersController < Admins::ApplicationController
  
  def show_all
    @orders = Order.all
    @customers = Customer.all
    @order_detail = OrderDetail.all
  end
  
  def show
    @order = Order.find(params[:id])
    @customer = Customer.find(orders.customer_id)
    @order_details = Order_detail.where(order_id: params[:id])
    @items = Item.find(item_id: params[:id])
  end
  
end
