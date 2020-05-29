class CreateCollections < ActiveRecord::Migration[6.0]
  def change
    create_table :collections do |t|
      t.string :name
      t.string :station
      t.integer :year
      t.string :status
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
