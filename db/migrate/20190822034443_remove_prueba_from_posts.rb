class RemovePruebaFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :prueba, :string
  end
end
