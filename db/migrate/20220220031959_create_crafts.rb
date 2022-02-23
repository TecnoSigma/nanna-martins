class CreateCrafts < ActiveRecord::Migration[6.1]
  def change
    create_table :crafts do |t|
      t.string :segment
      t.string :kind
      t.integer :quantity
      t.string :season
      t.string :year
      t.string :exclusivity
      t.float :worked_hours
      t.float :weight
      t.string :reference

      # add photos

      t.timestamps
    end
  end
end
