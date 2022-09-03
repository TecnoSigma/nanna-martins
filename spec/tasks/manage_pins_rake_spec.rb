# frozen_string_literal: true

require 'rails_helper'

Rails.application.load_tasks

describe 'Rakes' do
  describe 'manage_pins:collect' do
    it 'creates new pins' do
      url = 'https://i.pinimg.com/originals/71/f5/a2/71f5a2490947a4ecae28cf754a4b3d7a.jpg'
      pin_data = "[{\n  \"sourceUrl\": \"https://br.pinterest.com/nannamartins/pins/\",\n  \"profile\": \"nannamartins\",\n  \"image\": {\n    \"width\": 871,\n    \"height\": 1170,\n    \"url\": \"#{url}\"\n  },\n  \"title\": \"\",\n  \"is_native\": false,\n  \"is_video\": false,\n  \"link\": \"https://500px.com/photo/102773067/in-flowers-by-%D0%A2%D0%B0%D1%82%D1%8C%D1%8F%D0%BD%D0%B0-%D0%A4%D0%B5%D1%86%D0%B8%D1%87?from=user\",\n  \"is_eligible_for_pdp\": false,\n  \"aggregated_pin_data\": {\n    \"saves\": 881,\n    \"done\": 0\n  },\n  \"story_pin_data_id\": null,\n  \"alt_text\": null,\n  \"is_promoted\": false,\n  \"videos\": null,\n  \"is_oos_product\": false,\n  \"video_status_message\": null,\n  \"view_tags\": [],\n  \"repin_count\": 0,\n  \"created_at\": \"Mon, 16 May 2022 02:25:28 +0000\",\n  \"grid_description\": \"BR*\",\n  \"carousel_data\": null,\n  \"id\": \"87609155242890934\",\n  \"is_repin\": true,\n  \"promoter\": null,\n  \"video_status\": null,\n  \"description\": \"BR*\",\n  \"price_value\": 0,\n  \"price_currency\": \"USD\",\n  \"shopping_flags\": [],\n  \"story_pin_data\": null,\n  \"insertion_id\": null,\n  \"board\": {\n    \"id\": \"87609223940331429\",\n    \"image_thumbnail_url\": \"https://i.pinimg.com/upload/87609223940331429_board_thumbnail_2022-05-16-02-25-30_500_60.jpg\",\n    \"name\": \"[Atelier]\",\n    \"is_collaborative\": false,\n    \"url\": \"/nannamartins/atelier/\"\n  },\n  \"reaction_counts\": {},\n  \"is_playable\": false,\n  \"domain\": \"500px.com\",\n  \"is_whitelisted_for_tried_it\": true,\n  \"description_html\": \"BR*\",\n  \"product_pin_data\": null,\n  \"embed\": null,\n  \"is_stale_product\": false,\n  \"grid_title\": \"\"\n}]"

      response = double

      allow(response).to receive(:body) { pin_data }
      allow(RestClient).to receive(:get) { response }

      Rake::Task['manage_pins:collect'].invoke

      result = Pin.find_by(url: url)

      expect(result).to be_present
    end
  end

  describe 'manage_pins:remove' do
    it 'removes all pins' do
      FactoryBot.create(:inspiration, type: 'Pin')

      Rake::Task['manage_pins:remove'].invoke

      result = Pin.all

      expect(result).to be_empty
    end
  end
end
