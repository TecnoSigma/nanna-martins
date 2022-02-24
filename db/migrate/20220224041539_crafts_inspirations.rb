class CraftsInspirations < ActiveRecord::Migration[6.1]
  def change
    create_join_table :crafts, :inspirations do |t|
      t.index :craft_id
      t.index :inspiration_id
    end
  end
end
