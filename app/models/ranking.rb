class Ranking < ApplicationRecord
    has_many :user
    def self.get_ranking_list
        sql = ("
        SELECT 
        1+(SELECT count(*) 
        from (select point from Users GROUP BY point) as A 
        WHERE A.point > B.point) as rnk,
        first_name, last_name, email, point FROM Users as B ORDER BY point desc")
        list_rankings = ActiveRecord::Base.connection.execute(sql)
    end
    
end
