class AddPropertyIdToServiceProviders < ActiveRecord::Migration
  def change
    add_column :service_providers, :property_id, :integer
  end
end
