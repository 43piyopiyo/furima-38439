class Item < ApplicationRecord
  belongs_to :user
  # has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :delivery_free, :prefecture, :shipping_day

  validates :name,                    presence: true
  validates :detail,                  presence: true
  validates :category_id,             presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id,            presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_free_id,        presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,           presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_day_id,         presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price,                   presence: true
  validates :user,                    presence: true

end
