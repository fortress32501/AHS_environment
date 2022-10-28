# frozen_string_literal: true

json.extract!(user, :id, :first_name, :last_name, :email, :password_digest, :point, :is_admin, :created_at, :updated_at)
json.url(user_url(user, format: :json))
