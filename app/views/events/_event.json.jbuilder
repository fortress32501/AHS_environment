json.extract! event, :id, :title, :section, :schedule, :points, :passcode, :created_at, :updated_at
json.url event_url(event, format: :json)
