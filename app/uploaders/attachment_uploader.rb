# encoding: utf-8

class AttachmentUploader < CarrierWave::Uploader::Base

  include CarrierWave::MimeTypes
  include CarrierWave::MiniMagick

  IMAGE_TYPES = %w( png jpg jpeg svt )

  process :set_content_type
  process :set_content_type_on_model

  # Choose what kind of storage to use for this uploader:
  # storage :file
  storage :fog

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    ActionController::Base.helpers.image_path('document-icon.png')
  end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :thumb, if: :image? do
    process :set_content_type
    process resize_to_fit: [50, 50]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png doc docx pdf xls xlsx)
  end

  def set_content_type_on_model
    model.content_type = file.content_type if file.content_type
  end

protected

  def image?(new_file)
    new_file.content_type.start_with? 'image'
  end
end
