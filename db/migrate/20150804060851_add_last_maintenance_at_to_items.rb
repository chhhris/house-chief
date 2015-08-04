class AddLastMaintenanceAtToItems < ActiveRecord::Migration
  def change
    add_column :items, :last_maintenance_at, :datetime
  end
end
