class AddDetailsToFinances < ActiveRecord::Migration[5.0]
  def change
    change_column :finances, :payment_due, :decimal, precision: 5, scale: 2
  end
end
