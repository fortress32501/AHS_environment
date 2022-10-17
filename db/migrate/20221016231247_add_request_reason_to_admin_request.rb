class AddRequestReasonToAdminRequest < ActiveRecord::Migration[6.1]
  def change
    add_column :admin_requests, :request_reason, :string
  end
end
