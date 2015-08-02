class AddAdminToPropertyUsers < ActiveRecord::Migration
  def change
    add_column :property_users, :admin, :boolean
  end
end
