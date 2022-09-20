class Item < ApplicationRecord
  belongs_to :user
  # has_one :order
  has_one_attached :image


  validates :name,                    presence: true
  validates :detail,                  presence: true
  validates :category_id,             presence: true
  validates :condition_id,            presence: true
  validates :delivery_free_id,        presence: true
  validates :prefecture_id,           presence: true
  validates :shipping_day_id,         presence: true
  validates :price,                   presence: true
  validates :user,                    presence: true

end
