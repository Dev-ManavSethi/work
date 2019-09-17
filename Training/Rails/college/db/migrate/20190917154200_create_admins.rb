class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.text :username
      t.integer :password

      t.timestamps
    end
  end
end
