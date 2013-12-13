class AddEstimatesCustomerId < ActiveRecord::Migration
  def change
    add_column :estimates, :customer_id, :integer, index: true
  end
end
