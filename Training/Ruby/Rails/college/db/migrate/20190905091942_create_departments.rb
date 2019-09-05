class CreateDepartments < ActiveRecord::Migration[6.0]
  def change
    create_table :departments do |t|
	t.text :name
	t.decimal :hod_id
    end
  end
end
