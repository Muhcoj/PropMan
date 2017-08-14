class AddFlatDetailsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :flatnumber, :integer
    add_column :users, :flatsize, :integer
    add_column :users, :co_ownership, :integer
  end
end
