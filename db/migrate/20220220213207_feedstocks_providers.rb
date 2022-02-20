class FeedstocksProviders < ActiveRecord::Migration[6.1]
  def change
    create_join_table :feedstocks, :providers do |t|
      t.index :feedstock_id
      t.index :provider_id
    end
  end
end
