class CreateCalls < ActiveRecord::Migration[5.1]
  def change
    create_table :calls do |t|
      t.boolean :judgement
      t.integer :user_id
      t.integer :splain_id

      t.timestamps
    end
    add_index :calls, [:user_id, :splain_id]
  end
end
