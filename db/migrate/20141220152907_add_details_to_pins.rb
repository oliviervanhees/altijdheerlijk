class AddDetailsToPins < ActiveRecord::Migration
  def change
    add_column :pins, :ingredients, :string
    add_column :pins, :method, :string
  end
end
