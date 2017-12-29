class CreateSplains < ActiveRecord::Migration[5.1]
  def change
    create_table :splains do |t|
      t.text :content
      t.integer :user_id
      t.timestamps
    end
    add_index :splains, [:user_id, :created_at]
  end
end
