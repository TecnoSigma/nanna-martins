class ProvidersStocks < ActiveRecord::Migration[6.1]
  def change
    create_join_table :providers, :stocks do |t|
      t.index :provider_id
      t.index :stock_id
    end
  end
end
