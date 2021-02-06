class ItemsController < ApplicationController
  before_action :authenticate_user! , except: [:index ]
  
  def index
    @item = Item.all.order("created_at DESC").includes(:item)
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
    params.require(:item).permit(:image,:name, :explanation,:category_id, :status_id,:shipping_charge_id,:dispatch_area_id,:shipping_duration_id,:price).merge(user_id: current_user.id)
  end
end
