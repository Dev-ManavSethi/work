class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.references :department, foreign_key: true
      t.references :teacher, foreign_key: true

      t.timestamps
    end
  end
end
