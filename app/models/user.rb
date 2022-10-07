
class User < ApplicationRecord
    has_secure_password
    validates :first_name, :last_name, :email, presence: true
    # has_one :ranking_id
    # https://medium.com/@rmeji1/creating-a-login-with-simple-auth-using-ruby-on-rails-7dd95a03cb7a
   #  https://guides.rubyonrails.org/association_basics.html
    
    def welcome
    "Hello, #{self.first_name} #{self.last_name} !"
    end

    
    # belongs_to :ranking
end

