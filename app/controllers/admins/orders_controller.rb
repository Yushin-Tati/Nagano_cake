class Admins::OrdersController < ApplicationController
  
  def show
    @orders = Order.all
    @customer = Customer.all
    @order_detail = OrderDetail.all
  end
  
end
