class CreateCrafts < ActiveRecord::Migration[6.1]
  def change
    create_table :crafts do |t|
      t.string :code

      t.timestamps
    end
  end
end
