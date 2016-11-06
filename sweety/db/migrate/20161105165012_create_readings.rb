class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
    	t.integer :level
    	t.references :user
      t.date :date
      t.timestamps null: false
    end
  end
end
