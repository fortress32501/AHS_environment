class CreateAdminRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :admin_requests do |t|
      t.integer :user_id
      t.string :request_status

      t.timestamps
    end
  end
end
