class CreateServiceProviders < ActiveRecord::Migration
  def change
    create_table :service_providers do |t|
      t.text :name
      t.text :phone
      t.text :address
      t.text :description

      t.timestamps null: false
    end
  end
end
