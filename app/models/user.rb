class User < ActiveRecord::Base
  has_secure_password
  has_many :chats

  def full_name
      [last_name, first_name].join(", ")
    end

  validates :user_name, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true


end
