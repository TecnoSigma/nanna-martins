class CreateInspirations < ActiveRecord::Migration[6.1]
  def change
    create_table :inspirations do |t|
      t.string :type
      t.string :url
      t.string :segment
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
