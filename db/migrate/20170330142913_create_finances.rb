class CreateFinances < ActiveRecord::Migration[5.0]
  def change
    create_table :finances do |t|
      t.string :year
      t.string :month
      t.decimal :gas
      t.decimal :water
      t.decimal :electricity
      t.decimal :payment_due

      t.timestamps
    end
  end
end
