class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.text :attachment_url
      t.string :attachment_type
      t.integer :item_id

      t.timestamps null: false
    end
  end
end
