# frozen_string_literal: true

json.array! @rankings, @list_rankings, partial: 'rankings/ranking', as: :ranking
