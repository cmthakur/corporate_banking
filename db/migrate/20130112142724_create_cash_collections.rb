class CreateCashCollections < ActiveRecord::Migration
  def change
    create_table :cash_collections do |t|
      t.integer :id
      t.integer :account_id, :null => false
      t.float :amount, :default => 0
      t.integer :member_id, :null => false

      t.timestamps
    end
  end
end
