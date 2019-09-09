class UpDownExample < ActiveRecord::Migration[5.2]
  def change
    reversible do |direction|
      direction.up {change_column :departments, :id, :string, null:true, precision:10, scale:4, default:25, comment: "Changing departmnts id text to integer"}
      direction.down{change_column :departmnts, :id, :text, null: false}
      direction.up {add_column :subjects, :sample_column, :text}
      direction.down{remove_column :subjects, :sample_column, :text}
      direction.up{add_index :students, :id}
      direction.down{remove_index :students, :id}
      direction.up{add_reference :departments, :subjects, name: "Reference_to_subjects"}
      direction.down{remove_reference :departments, :subjects, :Reference_to_subjects}
      direction.up{create_join_table :teachers, :subjects}
      direction.down{drop_join_table :teachers, :subjects}
      direction.up{change_column_null :departments, :name, true}
      direction.down{change_column_null :departments, :name, false}
      direction.up{change_column_default :departments, :name, from: "" ,to: "Default name"}
      direction.up{add_column :departments, :new_column, :decimal, precision:10, scale:4, limit:10, comment: "New column at migration", null:true, default: 25,polymorphic:true}
      direction.down{remove_column :departmnts, :new_column }
      direction.up{add_foreign_key :sections, :departments, name: "fk_sections"}
      direction.down{remove_foreign_key :sections, :departments, name: "fk_sections"}
      direction.up{create_table :new_table do |t|
        t.text :name
        t.timestamps end}
      direction.down{drop_table :new_table}
      direction.up{rename_column :departmnts, :name, :new_name}
      direction.down{rename_column :departmnts, :new_name, :name}
      direction.up{rename_table :departmnts, :new_departments}
      direction.down{rename_table :new_departments, :departmnts}
  end
end

end
