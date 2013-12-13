class CreateEstimates < ActiveRecord::Migration
  def change
    create_table :estimates do |t|
      t.integer :cost
      t.integer :invoice_id, index: true
      t.timestamps
    end
  end
end
