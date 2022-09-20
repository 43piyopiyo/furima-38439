class Item < ApplicationRecord
  belongs_to :user
  # has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_free
  belongs_to :prefecture
  belongs_to :shipping_day

  validates :image,                   presence: true
  validates :name,                    presence: true
  validates :detail,                  presence: true
  validates :category_id,             presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id,            presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_free_id,        presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,           presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_day_id,         presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price,                   presence: true, numericality: { greater_than_or_equal_to: 300, message: 'must be greater_than_or_equal_to 300' }
  validates :price,                   presence: true, numericality: { less_than_or_equal_to: 9999999, message: 'must be less_than_or_equal_to 9999999' }
  validates :price,                   presence: true, numericality: { only_integer: true, message: 'should be half-width numbers' }
end
