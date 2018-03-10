class AddKeysToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :public_key_file, :string, null: false, default: ''
    add_column :users, :private_key_file, :string, null: false, default: ''
  end
end
