class RenameItemAttachmentAttachmentToFile < ActiveRecord::Migration
  def change
    rename_column :item_attachments, :attachment, :file
  end
end
