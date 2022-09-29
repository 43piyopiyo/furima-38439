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
    validates :category_id, numericality: { other_than: 1, message: "を入力してください"}
    validates :condition_id, numericality: { other_than: 1, message: "を入力してください" }
    validates :delivery_free_id, numericality: { other_than: 1, message: "を入力してください" }
    validates :prefecture_id, numericality: { other_than: 1, message: "を入力してください" }
    validates :shipping_day_id, numericality: { other_than: 1, message: "を入力してください" }
    validates :price
  end

  validates :price, allow_blank: true, numericality: { greater_than_or_equal_to: 300, message: 'は¥300以下だと出品できません' }
  validates :price, allow_blank: true, numericality: { less_than_or_equal_to: 9999999, message: 'は¥10,000,000以上だと出品できません' }
  validates :price, allow_blank: true, numericality: { only_integer: true, message: 'は半角数字で入力してください' }

end
