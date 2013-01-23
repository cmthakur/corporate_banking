class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :id
      t.string :user_name
      t.string :type
      t.integer :profile_id
      t.string :status,:default => 'joined'
      t.timestamps
    end
  end
end
