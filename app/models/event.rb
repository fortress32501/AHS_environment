# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :event_type, optional: true
  has_many :users, through: :attendance
  validates :event_points, :event_description, :event_passcode, :event_start, :event_end, :event_title, :event_location, presence: true
end
