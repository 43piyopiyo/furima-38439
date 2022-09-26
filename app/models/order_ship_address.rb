class OrderShipAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address_detail, :apartment, :phone_number, :token

  validates :user_id,                 presence: true
  validates :item_id,                 presence: true
  validates :prefecture_id,           presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :city,                    presence: true
  validates :address_detail,          presence: true
  validates :token,                   presence: true

  VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/
  validates :postal_code, presence: true, format: { with: VALID_POSTAL_CODE_REGEX }

  VALID_PHONE_NUMBER_REGEX = /\A\d{10,11}\z/
  validates :phone_number,            presence: true, format: { with: VALID_PHONE_NUMBER_REGEX }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShipAddress.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, address_detail: address_detail, apartment: apartment, phone_number: phone_number)
  end
end