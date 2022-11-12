# frozen_string_literal: true

class CreateEventTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :event_types do |t|
      t.string :type_name
      t.string :description
      t.string :color

      t.timestamps
    end
  end
end
