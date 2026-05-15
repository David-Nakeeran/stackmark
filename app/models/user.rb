class User < ApplicationRecord
  has_secure_password
  validates :password, length: { minimum: 8 }, if: -> { password.present? }
  validates :email_address, presence: true, uniqueness: true
  has_many :sessions, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :tags, through: :bookmarks
  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
