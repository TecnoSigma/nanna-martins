class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :kind
      t.string :document
      t.string :email
      t.string :contact
      t.string :address
      t.string :number
      t.string :complement
      t.string :district
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :telephone
      t.string :cellphone
      t.string :status, default: 'ativo'

      t.timestamps
    end
  end
end
