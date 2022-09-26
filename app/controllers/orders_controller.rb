class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :login_unlogin


  def index
    @item = Item.find(params[:item_id])
    @ordershipaddress = OrderShipAddress.new
  end

  def create
    @ordershipaddress = OrderShipAddress.new(ordershipaddress_params)
    if @ordershipaddress.valid?
      @ordershipaddress.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private
    def ordershipaddress_params
      params.require(:order_ship_address).permit(:postal_code, :prefecture_id, :city, :address_detail, :apartment, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id].to_i)
    end



    def login_unlogin
      @item = Item.find(params[:item_id])
      if current_user.id == @item.user_id || @item.order.present?
        redirect_to root_path
      end
    end

end