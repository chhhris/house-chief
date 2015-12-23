class Item < ActiveRecord::Base

  belongs_to :property, touch: true
  has_many :item_attachments, dependent: :destroy
accepts_nested_attributes_for :item_attachments, allow_destroy: true
  has_many :item_users
  has_many :users, through: :item_users

  FREQUENCY = {
    daily:      1.day.to_i,
    weekly:     1.week.to_i,
    monthly:    1.month.to_i,
    quarterly:  3.months.to_i,
    biannually: 6.months.to_i,
    annually:   1.year.to_i
  }.with_indifferent_access

end
