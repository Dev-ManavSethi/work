class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers, :id => false, :primary_key => :id do |t|
      t.text :id
      t.text :name
      t.date :dob
      t.integer :exp
      t.timestamps
    end
  end
end
