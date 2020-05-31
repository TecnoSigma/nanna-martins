class CreateAccessoriesCustomersJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :accessories, :customers do |t|
      t.index :accessory_id 
      t.index :customer_id
    end
  end
end
