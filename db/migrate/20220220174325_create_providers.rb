class CreateProviders < ActiveRecord::Migration[6.1]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :kind
      t.string :document
      t.string :site
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
      t.string :status, default: 'ativo'

      t.timestamps
    end
  end
end
