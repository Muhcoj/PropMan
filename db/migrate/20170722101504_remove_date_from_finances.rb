class RemoveDateFromFinances < ActiveRecord::Migration[5.0]
  def change
    remove_column :finances, :date, :datetime
  end
end
