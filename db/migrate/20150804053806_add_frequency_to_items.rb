class AddFrequencyToItems < ActiveRecord::Migration
  def change
    add_column :items, :frequency, :integer
  end
end
