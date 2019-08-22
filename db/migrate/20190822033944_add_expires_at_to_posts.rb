class AddExpiresAtToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :expires_at, :datetime
  end
end
