# frozen_string_literal: true

class Ranking < ApplicationRecord
  has_many :user
  validates :title, presence: true
  validates :point_total, presence: true
  def self.get_ranking_list
    sql = "
        SELECT
        1+(SELECT count(*)
        from (select point from Users GROUP BY point) as A
        WHERE A.point > B.point) as rnk,
        first_name, last_name, email, ranking_id, id, point FROM Users as B ORDER BY point desc"
    list_rankings = ActiveRecord::Base.connection.execute(sql)
  end
end
