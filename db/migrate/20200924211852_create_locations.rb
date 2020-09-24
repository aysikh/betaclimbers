class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :rock_type
      t.text :approach
      t.string :popularity
      t.text :picture

      t.timestamps
    end
  end
end
