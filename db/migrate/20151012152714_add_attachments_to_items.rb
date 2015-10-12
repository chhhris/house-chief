class AddAttachmentsToItems < ActiveRecord::Migration
  def change
    add_column :items, :attachments, :json
  end
end
