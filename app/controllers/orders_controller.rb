class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :same_item
  before_action :login_unlogin
  
  def index
    @ordershipaddress = OrderShipAddress.new
  end

  def create
    @ordershipaddress = OrderShipAddress.new(ordershipaddress_params)
    if @ordershipaddress.valid?
      pay_item
      @ordershipaddress.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
    def ordershipaddress_params
      params.require(:order_ship_address).permit(:postal_code, :prefecture_id, :city, :address_detail, :apartment, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id].to_i, token: params[:token])
    end

    def same_item
      @item = Item.find(params[:item_id])
    end

    def login_unlogin
      if current_user.id == @item.user_id || @item.order.present?
        redirect_to root_path
      end
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: ordershipaddress_params[:token],
        currency: 'jpy'
      )
    end

end