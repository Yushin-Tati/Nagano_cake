class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  def subtotal_price
    item.price * amount
  end

  def total_price
    cart_items.to_a.sum { |item| item.subtotal_price }
  end


end
