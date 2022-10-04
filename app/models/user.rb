
class User < ApplicationRecord
    has_secure_password
    validates :first_name, :last_name, :email, presence: true
    # https://medium.com/@rmeji1/creating-a-login-with-simple-auth-using-ruby-on-rails-7dd95a03cb7a
    def welcome
    "Hello, #{self.first_name} #{self.last_name} !"
    end
end

