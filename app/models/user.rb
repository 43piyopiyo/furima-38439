class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  validates :nickname,        presence: true
  validates :email,           presence: true
  validates :epassword,       presence: true
  validates :last_name,       presence: true
  validates :first_name,      presence: true
  validates :ruby_last_name,  presence: true
  validates :ruby_first_name, presence: true
  validates :birthday,        presence: true
end