class Property < ActiveRecord::Base

  has_many :property_users
  has_many :users, through: :property_users
  has_many :service_providers
  has_many :items
  has_many :attachments

  belongs_to :creator, class_name: 'User'

  after_create :create_property_user_on_creator

private

  def create_property_user_on_creator
    self.property_users.create(user_id: self.creator_id)
  end
end
