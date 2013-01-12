class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :id
      t.string :name,:null => false
      t.string :type,:null => false
      t.integer :profile_id,:null => false
      t.string :status,:null => false
      t.string :email,:null => false

      t.timestamps
    end
  end
end
