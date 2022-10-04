json.extract! admin_request, :id, :user_id, :request_status, :created_at, :updated_at
json.url admin_request_url(admin_request, format: :json)
