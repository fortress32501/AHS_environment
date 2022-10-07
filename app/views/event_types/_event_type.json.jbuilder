json.extract! event_type, :id, :type_name, :description, :color, :created_at, :updated_at
json.url event_type_url(event_type, format: :json)
