class AddColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :sections, :name, :text
  end
end
