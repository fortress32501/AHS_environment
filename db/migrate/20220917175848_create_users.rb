# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.integer :point, default: 0
      t.boolean :is_admin, default: false

      t.belongs_to :ranking

      t.timestamps
    end
  end
end
