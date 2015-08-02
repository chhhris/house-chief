class CreatePropertyUsers < ActiveRecord::Migration
  def change
    create_table :property_users do |t|
      t.integer :user_id
      t.integer :property_id

      t.timestamps null: false
    end
  end
end
