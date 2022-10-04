class AdminRequest < ApplicationRecord
    belongs_to :user
    validates :user_id, :request_status, presence: true
end
