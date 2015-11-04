class CreateItemAttachments < ActiveRecord::Migration
  def change
    create_table :item_attachments do |t|
      t.integer :item_id
      t.string :attachment

      t.timestamps null: false
    end
  end
end
