class AddColumnToRoute < ActiveRecord::Migration[6.0]
  def change
    add_column :routes, :picture, :text
  end
end
