class ChangeUserColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :prueba, :readed_posts
  end
end
