class UpdateIndexesOnSubscribers < ActiveRecord::Migration
  def up
    remove_index :subscribers, [:email, :trapping_code]
    add_index :subscribers, :email, unique: true
    add_index :subscribers, :trapping_code, unique: true
  end

  def down
    add_index :subscribers, [:email, :trapping_code], unique: true
  end
end
