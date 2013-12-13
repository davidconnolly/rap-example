class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :note
      t.string :record_type
      t.integer :record_id
      t.timestamps
    end
  
    add_index :comments, [ :record_type, :record_id ]
  end
end
