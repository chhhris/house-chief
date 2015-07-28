class CreateItemUsers < ActiveRecord::Migration
  def change
    create_table :item_users do |t|
      t.integer :item_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
