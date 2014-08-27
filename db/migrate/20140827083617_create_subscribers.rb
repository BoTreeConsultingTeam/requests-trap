class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :email
      t.string :name
      t.string :trapping_code

      t.timestamps
    end

    add_index :subscribers, [:email, :trapping_code], unique: true
  end
end
