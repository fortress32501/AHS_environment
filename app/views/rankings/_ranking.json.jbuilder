# frozen_string_literal: true

json.extract! ranking, :id, :title, :point_total, :created_at, :updated_at
json.url ranking_url(ranking, format: :json)
