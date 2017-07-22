class AddDatseToFinances < ActiveRecord::Migration[5.0]
  def change
    add_column :finances, :date, :date
  end
end
