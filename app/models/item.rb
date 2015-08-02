class Item < ActiveRecord::Base

  has_many :item_users
  has_many :users, through: :item_users
  has_many :attachments
end
