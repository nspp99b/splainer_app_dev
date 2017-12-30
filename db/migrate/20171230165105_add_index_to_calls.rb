class AddIndexToCalls < ActiveRecord::Migration[5.1]
  def change
    remove_index :calls, [:user_id, :splain_id]
    add_index :calls, [:user_id, :splain_id], unique: true
  end
end
