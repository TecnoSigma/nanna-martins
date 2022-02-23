class CreateFeedstocks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedstocks do |t|
      t.string :name
      t.float :price
      t.string :measurement_unit
      t.integer :quantity
      t.string :description
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
