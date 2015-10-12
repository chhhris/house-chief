class Item < ActiveRecord::Base

  belongs_to :property
  has_many :item_users
  has_many :users, through: :item_users
  has_many :attachments

  mount_uploaders :attachment, AttachmentUploader

  FREQUENCY = {
    daily:      1.day.to_i,
    weekly:     1.week.to_i,
    monthly:    1.month.to_i,
    quarterly:  3.months.to_i,
    biannually: 6.months.to_i,
    annually:   1.year.to_i
  }.with_indifferent_access

end
