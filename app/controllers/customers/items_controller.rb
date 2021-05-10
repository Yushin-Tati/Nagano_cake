class Customers::ItemsController < Customers::ApplicationController

  helper_method :tax_price

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @duplication = 0
    if current_customer
      current_customer.cart_items.each do |cart_item|
        if cart_item.item == @item
          @duplication += 1
        end
      end
    end
  end

end
