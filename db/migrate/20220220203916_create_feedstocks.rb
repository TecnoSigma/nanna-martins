class CreateFeedstocks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedstocks do |t|
      t.string :name
      t.string :measurement_unit
      t.integer :quantity
      t.string :description
      t.string :status, default: 'ativo'

      t.timestamps
    end
  end
end
