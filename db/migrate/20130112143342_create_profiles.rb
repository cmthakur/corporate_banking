class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :id
      t.string :fname,:null => false
      t.string :mname
      t.string :lname,:null => false
      t.integer :age,:null => false
      t.string :father_name,:null => false
      t.date :dob,:null => false
      t.string :district,:null => false
      t.string :zone
      t.integer :ward_no
      t.string :phone,:null => false
      t.string :occupation
      t.string :verification_id,:null => false
      t.string :verification_type
      t.string :maritial_status,:null => false

      t.timestamps
    end
  end
end
