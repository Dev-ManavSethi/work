class AddkeystoTokensNdKeys < ActiveRecord::Migration[6.0]
  def change
    add_column :api_keys, :key, :text
    add_column :auth_tokens, :auth_token, :text
    add_column :access_tokens, :access_token, :text
  end
end
