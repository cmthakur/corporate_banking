class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.integer :id
      t.string :type
      t.float :value

      t.timestamps
    end
  end
end
