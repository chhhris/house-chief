class Property < ActiveRecord::Base

  has_many :property_users
  has_many :admins, class_name: 'PropertyUser', conditions: { admin: true }
  has_many :items
  has_many :attachments
end
