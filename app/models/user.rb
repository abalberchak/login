 class User < ActiveRecord::Base
  has_many :secrets
  has_many :likes, dependent: :destroy
  # has_many :secrets, through: :likes, source: :secret

  has_secure_password
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, presence: true, on: :create
  validates :email, presence: true, uniqueness: { case_sensitive: false }, :format => { :with => email_regex }, on: :create

  # Test below for validatons
  validates :password, presence: true, confirmation: true, on: [:create]
  validates :password, length: { minimum: 8 }, allow_nil: true, on: [:update]

end
