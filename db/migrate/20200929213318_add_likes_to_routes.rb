class AddLikesToRoutes < ActiveRecord::Migration[6.0]
  def change
    add_column :routes, :likes, :integer, default: 0
  end
end
