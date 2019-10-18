class CreateAuthTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :auth_tokens do |t|
      t.references :company, references: :companies, foreign_key: {to_table: :companies}, index: true

      t.references :user, references: :users, foreign_key: {to_table: :users}, index: true

      t.timestamps
    end
  end
end
