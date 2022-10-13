class AddEventTypeToEvent < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :event_type_id, :string
  end
end
