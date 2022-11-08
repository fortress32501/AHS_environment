class AdminRequest < ApplicationRecord
    belongs_to :user
    validates :user_id, :request_status, :request_reason, presence: true
    
    def approve
        # update status of request to APPROVED
        sql = "
            UPDATE admin_requests
            SET request_status='APPROVED'
            WHERE id=#{id}"
        ActiveRecord::Base.connection.execute(sql)

        # update the users admin status
        sql = "
            UPDATE users
            SET is_admin=true
            WHERE id=#{user_id}"
        ActiveRecord::Base.connection.execute(sql)
    end

    def deny
        # update status of request to DENIED
        sql = "
            UPDATE admin_requests
            SET request_status='DENIED'
            WHERE id=#{id}"
        ActiveRecord::Base.connection.execute(sql)
    end
end
