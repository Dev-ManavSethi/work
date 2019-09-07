class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments, :id => false, :primary_key => :id do |t|
      t.text :id
      t.text :name
      t.belongs_to :teachers

      t.timestamps
    end
  end
end
