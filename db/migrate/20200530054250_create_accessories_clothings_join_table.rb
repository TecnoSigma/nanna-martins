class CreateAccessoriesClothingsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :accessories, :clothings do |t|
      t.index :accessory_id
      t.index :clothing_id
    end
  end
end
