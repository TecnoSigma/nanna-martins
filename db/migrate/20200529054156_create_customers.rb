class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :forename
      t.string :surname
      t.string :email
      t.string :gender
      t.string :document
      t.string :address
      t.string :number
      t.string :complement
      t.string :district
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :status
      t.string :password
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
