class AddContentTypeToItemAttachments < ActiveRecord::Migration
  def change
    add_column :item_attachments, :content_type, :string
  end
end
