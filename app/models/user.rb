class User < ApplicationRecord
    has_secure_password
    validates :first_name, :last_name, :email, presence: true
    def welcome
    "Hello, #{self.email}!"
    end
end
