class Login < ActiveRecord::Base
  validates :user_id, presence: true
  validates :token, uniqueness: true, presence: true

  
end
