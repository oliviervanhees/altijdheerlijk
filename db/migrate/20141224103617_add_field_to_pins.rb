class AddFieldToPins < ActiveRecord::Migration
  def change
    add_column :pins, :preparation, :text
  end
end
