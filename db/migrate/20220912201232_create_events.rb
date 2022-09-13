class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :section
      t.datetime :schedule
      t.integer :points
      t.string :passcode

      t.timestamps
    end
  end
end
