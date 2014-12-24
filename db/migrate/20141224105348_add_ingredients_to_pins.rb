class AddIngredientsToPins < ActiveRecord::Migration
  def change
    add_column :pins, :ingredients2, :text
  end
end
