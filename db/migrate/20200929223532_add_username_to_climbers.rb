class AddUsernameToClimbers < ActiveRecord::Migration[6.0]
  def change
    add_column :climbers, :username, :string
    add_column :climbers, :password_digest, :string
  end
end
