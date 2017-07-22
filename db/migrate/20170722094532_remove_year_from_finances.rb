class RemoveYearFromFinances < ActiveRecord::Migration[5.0]
  def change
    remove_column :finances, :year, :string
    remove_column :finances, :month, :string
  end
end
