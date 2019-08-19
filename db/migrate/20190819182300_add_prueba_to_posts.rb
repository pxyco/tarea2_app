class AddPruebaToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :prueba, :string
  end
end
