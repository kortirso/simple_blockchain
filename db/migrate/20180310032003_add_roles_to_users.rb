class AddRolesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :role, :string, null: false, default: 'patient'
  end
end