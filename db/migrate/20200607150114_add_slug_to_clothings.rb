class AddSlugToClothings < ActiveRecord::Migration[6.0]
  def change
    add_column :clothings, :slug, :string
    add_index :clothings, :slug, unique: true
  end
end
