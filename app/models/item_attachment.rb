class ItemAttachment < ActiveRecord::Base
  mount_uploader :file, AttachmentUploader

  belongs_to :item

  def is_image?
    content_type.start_with? 'image'
  end
end
