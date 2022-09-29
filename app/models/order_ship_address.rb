class OrderShipAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address_detail, :apartment, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :prefecture_id,           numericality: { other_than: 1 , message: "を入力してください"}
    validates :city
    validates :address_detail
    validates :token

    VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/
    validates :postal_code, format: { with: VALID_POSTAL_CODE_REGEX }

    VALID_PHONE_NUMBER_REGEX = /\A\d{10,11}\z/
    validates :phone_number, format: { with: VALID_PHONE_NUMBER_REGEX }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShipAddress.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, address_detail: address_detail, apartment: apartment, phone_number: phone_number)
  end
end