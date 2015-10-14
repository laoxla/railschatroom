class Chat < ActiveRecord::Base
  belongs_to :user
  belongs_to :railschatroom

 validates :text, presence: true

end
