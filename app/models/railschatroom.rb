class Railschatroom < ActiveRecord::Base
  has_many :users
  has_many :chats

  validates :name, presence: true
end
