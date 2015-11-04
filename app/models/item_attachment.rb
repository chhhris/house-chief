class ItemAttachment < ActiveRecord::Base
  mount_uploader :file, AttachmentUploader

  belongs_to :item
end
