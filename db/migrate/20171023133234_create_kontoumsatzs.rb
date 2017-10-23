class CreateKontoumsatzs < ActiveRecord::Migration[5.0]
  def change
    create_table :kontoumsatzs do |t|
      t.integer :weg
      t.string :wertstellung
      t.string :umsatzart
      t.string :buchungsdetails
      t.string :auftraggeber
      t.string :empfaenger
      t.decimal :betrag
      t.decimal :saldo

      t.timestamps
    end
  end
end
