class ServiceProvider < ActiveRecord::Base
  validates :phone, phony_plausible: { ignore_record_country_code: true, ignore_record_country_number: true }

  has_many :users
  belongs_to :property
end
