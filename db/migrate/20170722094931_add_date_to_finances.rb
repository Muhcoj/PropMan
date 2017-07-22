class AddDateToFinances < ActiveRecord::Migration[5.0]
  def change
    add_column :finances, :date, :datetime
  end
end
