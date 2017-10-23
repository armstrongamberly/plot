class CreateMarkers < ActiveRecord::Migration
  def change
    create_table :markers do |t|
    	
      t.string :name
      t.string :location
      t.string :website
      t.string :details
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
