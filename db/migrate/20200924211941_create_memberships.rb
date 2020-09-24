class CreateMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :memberships do |t|
      t.belongs_to :climber
      t.belongs_to :community

      t.timestamps
    end
  end
end