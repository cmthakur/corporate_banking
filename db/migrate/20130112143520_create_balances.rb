class CreateBalances < ActiveRecord::Migration
  def change
    create_table :balances do |t|
      t.integer :id
      t.float :amount, :default => 0
      t.integer :member_id
      t.integer :account_id
      t.integer :interest_id

      t.timestamps
    end
  end
end
