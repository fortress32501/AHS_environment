
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

    def assign_ranking
      ranking_found = Ranking.where("point_total <= #{self.point}").order(point_total: :desc)
      
      if ranking_found.empty? 
        # nothing to do
      else 
        # update ranking
        self.update(ranking_id: ranking_found.ids.at(0))
      end

      "Ranking is : #{self.ranking_id} !!"
    end

    
end
