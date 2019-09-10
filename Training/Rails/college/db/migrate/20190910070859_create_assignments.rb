class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments, :id => false, :primary_key=> :id do |t|
      t.text :id
      t.belongs_to :departments
      t.belongs_to :teachers

      t.timestamps
    end
  end
end
