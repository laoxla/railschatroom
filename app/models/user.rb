class User < ActiveRecord::Base
  has_secure_password
  has_many :chats

  def full_name
      [last_name, first_name].join(", ")
    end


end
