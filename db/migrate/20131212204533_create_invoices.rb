class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :cost_total
      t.integer :customer_id, index: true
      t.timestamps
    end
  end
end
