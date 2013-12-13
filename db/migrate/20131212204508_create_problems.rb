class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :description
      t.integer :vehicle_id, index: true
      t.integer :esimate_id, index: true
      t.timestamps
    end
  end
end
