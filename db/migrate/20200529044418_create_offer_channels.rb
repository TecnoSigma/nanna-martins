class CreateOfferChannels < ActiveRecord::Migration[6.0]
  def change
    create_table :offer_channels do |t|
      t.boolean :newsletter, default: true
      t.boolean :sms,        default: true
      t.boolean :whatsapp,   default: true
      t.references :customer, index: true
    end
  end
end
