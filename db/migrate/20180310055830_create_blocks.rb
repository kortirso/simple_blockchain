class CreateBlocks < ActiveRecord::Migration[5.1]
  def change
    create_table :blocks do |t|
      t.integer :doctor_id
      t.integer :user_id
      t.text :data
      t.integer :nonce, null: false, default: 0
      t.string :previous_hash, null: false, default: ''
      t.string :current_hash, null: false, default: ''
      t.datetime :created_at
    end
    add_index :blocks, :doctor_id
    add_index :blocks, :user_id
  end
end
