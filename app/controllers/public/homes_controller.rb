class Public::HomesController < ApplicationController
  def top
    @items = Item.where(is_sale_status: true).limit(4).order(id: "DESC")
  end

  def about

  end

  def redirect
    @id = params[:customer_id]
  end

end
