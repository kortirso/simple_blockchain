class CreateDoctors < ActiveRecord::Migration[5.1]
  def change
    create_table :doctors do |t|
      t.string :profession, null: false, default: ''
      t.string :hospital, null: false, default: ''
      t.integer :user_id
      t.timestamps
    end
    add_column :users, :name, :string, null: false, default: ''
    add_index :doctors, :user_id
  end
end
