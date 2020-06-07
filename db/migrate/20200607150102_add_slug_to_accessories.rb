class AddSlugToAccessories < ActiveRecord::Migration[6.0]
  def change
    add_column :accessories, :slug, :string
    add_index :accessories, :slug, unique: true
  end
end
