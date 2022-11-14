# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :events, through: :attendance
  has_many :attendance
  validates :first_name, :last_name, :email, presence: true
  belongs_to :ranking, optional: true
  # https://medium.com/@rmeji1/creating-a-login-with-simple-auth-using-ruby-on-rails-7dd95a03cb7a

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.forgot_password(self).deliver# This sends an e-mail with a link for the user to reset the password
  end
 
  # This generates a random password reset token for the user
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  # Check if current user is an admin
  def is_admin?
    is_admin
  end

  # Check if attendee is an admin
  def is_attendee_admin(user_id)
    User.find(user_id).is_admin?
  end

  # Display role type
  def role
    if is_admin?
      'Admin'
    else
      'Member'
    end
  end

  # find user first and last name by id
  def find_name(user_id)
    "#{User.find(user_id).last_name}, #{User.find(user_id).first_name}"
  end

  # first name last name format
  def full_name
    self.first_name + " " + self.last_name
  end 
  
  # show 3 recent attendance records
  def recent_attendance
    attendance_history.limit(3)
  end

  # join attendance table with event table on current user
  def attendance_history
    Attendance.joins(:event).where(attendances: { user_id: id }).order('created_at DESC')
  end

  # calculate attendance point of user
  def user_points
    attendance_history.sum(:event_points)
  end

  def assign_ranking
    # ranking_found = Ranking.where("point_total <= #{self.point}").order(point_total: :desc)
    ranking_found = Ranking.where('point_total <= ?', point).order(point_total: :desc)

    if ranking_found.empty?
      # nothing to do
    else
      # update ranking
      update(ranking_id: ranking_found.ids.at(0))
    end
    # "#{self.ranking_id}"
  end

  # https://stackoverflow.com/questions/45252984/how-to-update-specific-column-in-a-activerecord-on-rails
  def update_one_ranking(value)
    # ranking_found = Ranking.where("point_total <= #{self.point}").order(point_total: :desc)
    user = User.find(value)
    ranking_found = Ranking.where('point_total <= ?', user.point).order(point_total: :desc).first

    if ranking_found.nil?
      # nothing to do
    else
      # update ranking
      user.update(ranking_id: ranking_found.id)
      user.id.to_s
    end
    # "Ranking is : #{self.ranking_id} !!"
  end

  def get_ranking_title
    # ranking_found = Ranking.where("point_total <= #{self.point}").order(point_total: :desc)
    # SELECT title FROM Rankings Join Users On Rankings.id=2;

    title_found = Ranking.where(id: ranking_id).first
    if title_found.nil?
      # nothing to do
    else
      title_found.title.to_s
    end
  end

  def show_ranking_title(value)
    # ranking_found = Ranking.where("point_total <= #{self.point}").order(point_total: :desc)
    # SELECT title FROM Rankings Join Users On Rankings.id=2;
    title_found = Ranking.where(id: value).first
    if title_found.nil?
      # nothing to do
    else
      title_found.title.to_s
    end
  end

  def update_all_rankings
    User.all.each do |user|
      self.update_one_ranking(user.id)
    end
  end

end
