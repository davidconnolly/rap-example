class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :amount
      t.integer :invoice_id, index: true
      t.timestamps
    end
  end
end
