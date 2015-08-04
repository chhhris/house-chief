class ChangeItemFrequencyToString < ActiveRecord::Migration
  def change
    change_column :items, :frequency, :string
  end
end
