class Item < ActiveRecord::Base

  belongs_to :property
  has_many :item_users
  has_many :users, through: :item_users
  has_many :attachments

end
