# frozen_string_literal: true

class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.integer :user_id
      t.integer :event_id
      t.integer :points
      t.string  :password

      t.timestamps
    end
  end
end
