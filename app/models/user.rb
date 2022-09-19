class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :items
  # has_many :orders

  validates :nickname,        presence: true
  validates :email,           presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password,        presence: true, format: { with: VALID_PASSWORD_REGEX }
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :last_name
    validates :first_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヴー]+\z/u} do
    validates :ruby_last_name
    validates :ruby_first_name
  end
  validates :birthday,        presence: true
end