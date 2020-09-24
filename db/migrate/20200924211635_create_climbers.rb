class CreateClimbers < ActiveRecord::Migration[6.0]
  def change
    create_table :climbers do |t|
      t.string :name
      t.string :experience
      t.integer :birthyear
      t.text :bio
      t.string :height
      t.integer :weight
      t.string :origin
      t.string :preference
      t.text :profile_pic

      t.timestamps
    end
  end
end
