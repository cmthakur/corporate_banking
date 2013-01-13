class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :id
      t.string :name,:null => false
      t.string :type,:null => false
      t.integer :profile_id
      t.string :status
      t.integer :balance_id
      t.string :email,:null => false

      t.timestamps
    end
  end
end
