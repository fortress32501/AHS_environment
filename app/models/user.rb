
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
  
  # Display role type 
  def role?
    if is_admin?
      "Admin"
    else
      "Member"
    end
  end

  # join attendance table with event table
  def attendance_history
    @attendance_history = Attendance.joins(:event).where(attendances: { user_id: self.id }).order('event_start DESC')
  end

  # calculate attendance point of user
  def user_points
    @user_points = self.attendance_history.sum(:event_points)
  end

  def assign_ranking
    # ranking_found = Ranking.where("point_total <= #{self.point}").order(point_total: :desc)
    ranking_found = Ranking.where("point_total <= ?", self.point ).order(point_total: :desc)
    
    if ranking_found.empty? 
      # nothing to do
    else 
      # update ranking
      self.update(ranking_id: ranking_found.ids.at(0))
    end

    # "Ranking is : #{self.ranking_id} !!"
  end
  
  def get_ranking_title
    # ranking_found = Ranking.where("point_total <= #{self.point}").order(point_total: :desc)
    # SELECT title FROM Rankings Join Users On Rankings.id=2;
    title_found = Ranking.where(id: self.ranking_id).first
    if title_found == nil
      # nothing to do
    else 
      "#{ title_found.title }"
    end
  end

  def show_title(value)
    # ranking_found = Ranking.where("point_total <= #{self.point}").order(point_total: :desc)
    # SELECT title FROM Rankings Join Users On Rankings.id=2;
    title_found = Ranking.where(id: value).first
    if title_found == nil
      # nothing to do
    else 
      "#{ title_found.title }"
    end
  end

  
end
