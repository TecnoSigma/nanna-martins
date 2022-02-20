class CraftsFeedstocks < ActiveRecord::Migration[6.1]
  def change
    create_join_table :crafts, :feedstocks do |t|
      t.index :craft_id
      t.index :feedstock_id
    end
  end
end
