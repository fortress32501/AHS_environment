class AdminRequest < ApplicationRecord
    belongs_to :user
    validates :user_id, :request_status, :request_reason, presence: true
    
    def approve
        sql = "
        UPDATE admin_requests
        SET request_status='APPROVED'
        WHERE id=#{id}"
        ActiveRecord::Base.connection.execute(sql)
    end

    def deny
        sql = "
        UPDATE admin_requests
        SET request_status='DENIED'
        WHERE id=#{id}"
        ActiveRecord::Base.connection.execute(sql)
    end
end
