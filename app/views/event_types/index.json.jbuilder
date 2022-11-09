# frozen_string_literal: true

json.array! @event_types, partial: 'event_types/event_type', as: :event_type
