class User < ApplicationRecord
  has_secure_password
  has_many :recipes
  has_many :comments

  # xxx@xxx.xxx の形以外は弾く
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: VALID_EMAIL_REGEX }, allow_blank: true
  validates :password, presence: true
  # 半角文字・数値以外は弾く
  validates :password, length: { minimum: 8 }, format: { with: /\A[a-zA-Z0-9]+\z/ }, allow_blank: true
  validates :password, confirmation: true, allow_blank: true
end
