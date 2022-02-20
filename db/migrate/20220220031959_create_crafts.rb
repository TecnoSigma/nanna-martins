class CreateCrafts < ActiveRecord::Migration[6.1]
  def change
    create_table :crafts do |t|
      t.string :segment
      t.string :kind
      t.integer :quantity
      t.string :season
      t.string :year
      t.string :exclusivity
      t.string :reference

      t.timestamps
    end
  end
end
