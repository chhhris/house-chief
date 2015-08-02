class Property < ActiveRecord::Base

  has_many :property_users
  has_many :users, through: :property_users
  has_many :items
  has_many :attachments
end
