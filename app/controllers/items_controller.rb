class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    #@items = Item.all 
    #@items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def item_params
    params.require(:item).permit(:image,:product_name,:product_description, :price, :category_id, :product_status_id, :prefecture_id, :shipping_day_id, :shipping_charge_id).merge(user_id: current_user.id)
  end
end
