class OrdersController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_item , only: [:index,:create]
  
  def set_item
    @item = Item.find(params[:item_id])
  end

  def index
    @user_order = UserOrder.new
    unless current_user.id != @item.user_id
      redirect_to root_path
     end
  end

  def create
    @user_order = UserOrder.new(user_order_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def user_order_params
    params.require(:user_order).permit(:zip_number,:dispatch_area_id , :city, :block_number , :building_name , :phone_number ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token],price: @item.price)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: user_order_params[:price],
      card: user_order_params[:token],
      currency: 'jpy'
    )
  end

end