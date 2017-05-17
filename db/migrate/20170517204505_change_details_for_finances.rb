class ChangeDetailsForFinances < ActiveRecord::Migration[5.0]
  def change
  	change_column :finances, :gas, :decimal, precision: 6, scale: 2
    change_column :finances, :water, :decimal, precision: 6, scale: 2
    change_column :finances, :electricity, :decimal, precision: 6, scale: 2
  end
end
