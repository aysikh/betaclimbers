class CreateRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :routes do |t|
      t.string :name
      t.string :difficulty
      t.string :style
      t.belongs_to :location

      t.timestamps
    end
  end
end
