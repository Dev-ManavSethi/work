class CreateApiKeys < ActiveRecord::Migration[6.0]
  def change
    create_table :api_keys do |t|
      t.references :company, references: :companies, foreign_key: {to_table: :companies}, index: true

      t.timestamps
    end
  end
end
