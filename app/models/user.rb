
class User < ApplicationRecord
    has_secure_password
    has_many :events, through: :attendance
    validates :first_name, :last_name, :email, presence: true
    # https://medium.com/@rmeji1/creating-a-login-with-simple-auth-using-ruby-on-rails-7dd95a03cb7a
    def welcome
      "Hello, #{self.first_name} #{self.last_name} !"
    end

    # Check if current user is an admin
    def is_admin?
      self.is_admin
    end

end
