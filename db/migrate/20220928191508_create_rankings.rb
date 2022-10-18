class CreateRankings < ActiveRecord::Migration[6.1]
  def change
    create_table :rankings do |t|
      t.string :title
      t.integer :point_total
      
      #https://guides.rubyonrails.org/association_basics.html#the-has-one-association
      t.timestamps
    end
  end
end
