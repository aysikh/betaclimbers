class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.belongs_to :climber
      t.belongs_to :route
      
      t.timestamps
    end
  end
end
