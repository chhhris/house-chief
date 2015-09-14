class ServiceProvider < ActiveRecord::Base

  has_many :users
  belongs_to :property
end
