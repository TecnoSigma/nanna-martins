class CreateCosts < ActiveRecord::Migration[6.1]
  def change
    create_table :costs do |t|
      t.string :type
      t.float :quantity
      t.string :description
      t.string :periodicity
      t.float :price

      # Feedstock
      t.string :name
      t.string :measurement_unit

      t.references :craft, index: true

      t.timestamps
    end
  end
end
