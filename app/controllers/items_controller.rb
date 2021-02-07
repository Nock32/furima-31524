class ItemsController < ApplicationController
  before_action :authenticate_user! , except: [:index ,:show]
  
  def index
    @item = Item.all.order("created_at DESC")
    @item.includes(:item)
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
    @user = @item.user
  end

  def edit
    @item = Item.find(params[:id])
    unless current_user.id == @item.user_id
      redirect_to root_path
     end
  end

   def update
   
    @item = Item.find(params[:id])
    binding.pry
     if @item.update(item_params)
      redirect_to item_path
     else
       render :edit
     end
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
