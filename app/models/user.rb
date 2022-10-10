
class User < ApplicationRecord
    has_secure_password
    has_many :events, through: :attendance
    validates :first_name, :last_name, :email, presence: true
    
    belongs_to :ranking, :optional => true
    # belongs_to :ranking
    
    def welcome
      "Hello, #{self.first_name} #{self.last_name} !"
    end

    # Check if current user is an admin
    def is_admin?
      self.is_admin
    end

end
