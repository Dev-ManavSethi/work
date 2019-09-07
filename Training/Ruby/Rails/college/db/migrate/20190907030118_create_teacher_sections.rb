class CreateTeacherSections < ActiveRecord::Migration[5.2]
  def change
    create_table :teacher_sections do |t|
      t.references :teacher, foreign_key: true
      t.references :section, foreign_key: true

      t.timestamps
    end
  end
end
