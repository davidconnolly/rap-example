class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :make
      t.integer :year
      t.integer :customer_id, index: true
      t.timestamps
    end
  end
end
