class AddStatusToFinances < ActiveRecord::Migration[5.0]
  def change
    add_column :finances, :status, :integer, default: 0
  end
end
