class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_index

  def index
    if @item.order == nil
      @order = PayForm.new
    else
      redirect_to root_path
    end
  end

  def create
    @order = PayForm.new(order_params)
    # binding.pry
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:pay_form).permit(
      :postal_code,
      :prefecture_id,
      :city,
      :address,
      :building,
      :phone_number
    ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: "jpy"
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    return redirect_to root_path if current_user.id == @item.user.id
  end
  
  
end
