class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.datetime :delivery_forecast
      t.float :freight
      t.float :final_payment
      t.float :down_payment
      t.integer :quantity
      t.string :observation
      t.integer :status, default: 0

      t.references :customer, index: true

      t.timestamps
    end
  end
end
