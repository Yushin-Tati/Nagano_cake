class Public::ItemsController < ApplicationController

  def index
    @item = Item.all
    @items = Item.where(is_sale_status: true).page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
    @item_tax_included_price = (@item.price)
    if customer_signed_in?
      @customer = Customer.find(current_customer.id)
    end
    @cart_item = CartItem.new
  end

end
