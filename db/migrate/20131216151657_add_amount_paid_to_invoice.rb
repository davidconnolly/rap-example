class AddAmountPaidToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :amount_paid, :integer
  end
end
