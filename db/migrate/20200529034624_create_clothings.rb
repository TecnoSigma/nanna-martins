class CreateClothings < ActiveRecord::Migration[6.0]
  def change
    create_table :clothings do |t|
      t.string :reference
      t.string :kind
      t.string :name
      t.text :feature
      t.boolean :new
      t.text :history
      t.text :description, array: true, default: []
      t.string :status
      t.string :size
      t.text :complement, array: true, default: []
      t.integer :amount
      t.datetime :deleted_at
      t.references :collection, index: true
      t.references :gender,     index: true
      t.references :stock,      index: true

      t.timestamps
    end
  end
end
