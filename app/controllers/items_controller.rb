class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def set_item
    @item = Item.find(params[:id])
  end

  def index
    @item = Item.all.order('created_at DESC')
    @item.includes(:item)
  end

  def new
    @item = Item.new
  end

  def show
    @user = @item.user
  end

  def edit
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
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

  def destroy
    @item.destroy if current_user.id == @item.user_id
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :status_id, :shipping_charge_id, :dispatch_area_id,
                                 :shipping_duration_id, :price).merge(user_id: current_user.id)
  end
end
