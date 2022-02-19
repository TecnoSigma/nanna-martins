#require 'watir-webdriver'
#require 'openssl'
#require 'open-uri'
#require 'nokogiri'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class Pinterest
  def self.pins(url:, dir:)

# bad pinterest, having a bad cert
# OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

# read the pindb file
puts "reading pindb"
visited_pins = if File.exist?(dir + '/pindb')
			Marshal.load File.read(dir + '/pindb')
	       else
			[]
	       end

browser = Watir::Browser.new
browser.goto url

# wait for page to load
browser.div(:class => "profileImage").wait_until_present

# begin scraping
begin
	puts "starting to scrape pins"
	current_height = nil
	while current_height.nil? || last_height <= current_height
		current_height = browser.execute_script("document.scrollHeight\n");
		pin_links = browser.divs(:class => 'pinHolder').collect(&:links).flatten

		pin_cursor = 25
		while !pin_links[pin_cursor - 1].nil? && visited_pins.include?(pin_links[pin_cursor - 1].first.attribute_value("href"))
			puts "last available pin already downloaded, advancing pin cursor"
			pin_cursor += 25
		end
		# correct the pin_cursor
		pin_cursor -= 25

		pin_links[pin_cursor..-1].each_with_index do |links, i|
			href = links.first.attribute_value "href"
			if visited_pins.include?(href)
				puts "skipping #{href}, already downloaded"
				next
			end
			begin
				puts "fetching pin: #{href.inspect}"
				doc = Nokogiri::HTML(open(href.to_s))
				puts "searching for pin img tag"
				image = doc.css('.PaddedPin .Image img').first
				image_url = image["src"]
				puts "downloading image #{image_url}"
				filename = image_url.split('/').last
				open(dir + '/' + filename, 'wb') do |file|
					file << open(image_url).read
				end
				visited_pins << href
			rescue => e
				"error downloading pin #{href}: #{e.message}"
			end
		end
		puts "scrolling to bottom"
		browser.execute_script("window.scrollTo(0, document.body.scrollHeight);\n")
		sleep 5
		new_height = browser.execute_script("document.scrollHeight\n");
		puts "new_height: #{new_height.inspect}, current_height: #{current_height.inspect}"
	end
rescue => e
	puts "oops! #{e.message} \n #{e.backtrace.join("\n")}"
ensure
	puts "saving pindb"
	serialized_array = Marshal.dump(visited_pins)
	File.open(dir + "/pindb", 'w') {|f| f.write(serialized_array) }
end
  end
end
