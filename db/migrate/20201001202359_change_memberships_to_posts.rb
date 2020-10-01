class ChangeMembershipsToPosts < ActiveRecord::Migration[6.0]
  def change
    rename_table :memberships, :posts
  end
end
