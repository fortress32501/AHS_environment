
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

  
end
