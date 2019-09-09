class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students , :id => false, :primary_key => :id do |t|
      t.text :id
      t.text :name
      t.belongs_to :section
      
      t.timestamps
    end
  end
end
