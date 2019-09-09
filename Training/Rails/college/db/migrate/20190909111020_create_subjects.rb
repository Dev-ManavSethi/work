class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects, :id => false, :primary_key => :id do |t|
      t.text :id
      t.text :name
      t.integer :year
      t.belongs_to :department

      t.timestamps
    end
  end
end
