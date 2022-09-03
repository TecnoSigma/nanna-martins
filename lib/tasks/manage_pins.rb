# frozen_string_literal: true

class ManagePins
  def self.collect!
    pins_data.each do |pin|
      Pin.create(
        url: pin['image']['url'],
        segment: pin['board']['name'].gsub('[','').gsub( ']', '')
      )

      puts "Pin #{description(pin)} criado com sucesso!"
    end

    puts "===== #{total} criado(s) com sucesso! ====="
  end

  def self.remove!
    puts "===== #{total} removido(s) com sucesso! ====="

    Pin.destroy_all
  end

  def self.total
    Pin.all.count
  end

  def self.description(pin)
    pin['grid_title'] || pin['description']
  end

  def self.pins_data
    response = RestClient.get(ENV['PINTEREST_APIFY_URI'])

    JSON.parse(response.body)
  end

  private_class_method :total, :description, :pins_data
end
