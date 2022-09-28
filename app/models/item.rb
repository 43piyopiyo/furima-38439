class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_free
  belongs_to :prefecture
  belongs_to :shipping_day

  with_options presence: true do
    validates :image
    validates :name
    validates :detail
    validates :category_id, numericality: { other_than: 1, message: "can't be blank"}
    validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :delivery_free_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :shipping_day_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :price
  end

  validates :price, allow_blank: true, numericality: { greater_than_or_equal_to: 300, message: 'should be greater_than_or_equal_to 300' }
  validates :price, allow_blank: true, numericality: { less_than_or_equal_to: 9999999, message: 'should be less_than_or_equal_to 9999999' }
  validates :price, allow_blank: true, numericality: { only_integer: true, message: 'should be half-width numbers' }

end
