class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.integer :event_points
      t.string :event_description
      t.string :event_passcode
      t.datetime :event_start
      t.datetime :event_end
      t.string :event_title
      t.string :event_location

      t.timestamps
    end
  end
end
