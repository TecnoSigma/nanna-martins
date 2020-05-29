class CreateAccessories < ActiveRecord::Migration[6.0]
  def change
    create_table :accessories do |t|
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

      t.timestamps
    end
  end
end
