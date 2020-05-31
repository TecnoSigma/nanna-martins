class CreateClothingsCustomersJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :clothings, :customers do |t|
      t.index :clothing_id
      t.index :customer_id
    end
  end
end
