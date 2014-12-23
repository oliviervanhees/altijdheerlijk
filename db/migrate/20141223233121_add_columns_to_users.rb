class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider2, :string
    add_column :users, :uid2, :string
  end
end
