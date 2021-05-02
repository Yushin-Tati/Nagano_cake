class Admins::ItemsController < ApplicationController

  def index
    @items = Item.all
    @genre = Genre.all
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    if item.save
      redirect_to admins_item_path(item)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admins_item_path(item)
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price, :genre_id, :is_active)
  end

end
