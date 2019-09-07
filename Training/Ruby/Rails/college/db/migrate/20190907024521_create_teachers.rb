class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.text :name
      t.date :dob
      t.integer :experience
      t.timestamps
    end
  end
end
