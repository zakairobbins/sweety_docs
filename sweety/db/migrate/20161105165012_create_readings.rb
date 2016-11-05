class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
    	t.string :level
    	t.references :user
      t.timestamps null: false
    end
  end
end
