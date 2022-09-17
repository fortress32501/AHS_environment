json.extract! event, :id, :event_points, :event_description, :event_passcode, :event_start, :event_end, :event_title, :event_location, :created_at, :updated_at
json.url event_url(event, format: :json)
