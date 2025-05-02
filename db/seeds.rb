# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

require 'net/http'
# require 'phones_uri'
require 'json'


def import_brands
  uri = "https://mobile-devices-api1.p.rapidapi.com/brands?pageSize=totalItems"

  response = HTTParty.get(
    uri,
    headers: {
      "X-Rapidapi-Key" => "51bc23d70dmsh6429272287e5c73p18d54cjsn834e6269ba89",
      "Accept"         => "application/json"
    }
  )

  json = JSON.parse(response.body)['items'] || []

  json.each do |brand|
    Brand.create!(
      name: brand['name']
    )

    pp "#{brand["name"]} imported!"
  end
end

# import_brands

def import_phones
  Brand.all.each do |brand|
    uri = "https://mobile-devices-api1.p.rapidapi.com/devices?brandId=#{brand.id}&pageSize=totalItems"

    response = HTTParty.get(
      uri,
      headers: {
        "X-Rapidapi-Key" => "51bc23d70dmsh6429272287e5c73p18d54cjsn834e6269ba89",
        "Accept"         => "application/json"
      }
    )

    phones = JSON.parse(response.body)['items'] || []



      puts " Found #{phones.size} phones"

      phones.each do |data|
        phone = Phone.find_or_initialize_by(id: data['id'])
        phone.brand_id = brand.id
        phone.name         = data['name']
        phone.brand_name   = data.dig('brand', 'name')

        phone.battery_type     = data.dig('battery', 'type')
        phone.battery_charging = data.dig('battery', 'charging') || []

        phone.platform_os       = data.dig('platform', 'os')
        phone.platform_chipset  = data.dig('platform', 'chipset')
        phone.platform_cpu      = data.dig('platform', 'cpu')
        phone.platform_gpu      = data.dig('platform', 'gpu')

        phone.network_technology = data.dig('network', 'technology')
        phone.network_speed      = data.dig('network', 'speed')
        phone.network_2g         = data.dig('network', '2g').to_s.split(/,\s*/)
        phone.network_3g         = data.dig('network', '3g').to_s.split(/,\s*/)
        phone.network_4g         = data.dig('network', '4g').to_s.split(/,\s*/)
        phone.network_5g         = data.dig('network', '5g').to_s.split(/,\s*/)

        phone.display_type       = data.dig('display', 'type')
        phone.display_size       = data.dig('display', 'size')
        phone.display_resolution = data.dig('display', 'resolution')
        phone.display_protection = data.dig('display', 'protection')

        # parse dates safely
        if announced = data.dig('launch', 'announced')
          phone.launch_announced = Date.parse(announced.gsub(',', '')) rescue nil
        end
        if released = data.dig('launch', 'released')
          phone.launch_released = Date.parse(released.strip) rescue nil
        end
        phone.launch_status = data.dig('launch', 'status')

        phone.body_dimensions = data.dig('body', 'dimensions')
        phone.body_weight     = data.dig('body', 'weight')
        phone.body_build      = data.dig('body', 'build')
        phone.body_sim        = data.dig('body', 'sim')

        phone.memory_card_slot = data.dig('memory', 'cardSlot')
        phone.memory_internal  = data.dig('memory', 'internal')

        phone.sound_audio_jack  = data.dig('sound', 'audioJack')
        phone.sound_loudspeaker = data.dig('sound', 'loudspeaker')

        phone.comms_wlan        = data.dig('comms', 'wlan')
        phone.comms_bluetooth   = data.dig('comms', 'bluetooth')
        phone.comms_positioning = data.dig('comms', 'positioning')
        phone.comms_nfc         = data.dig('comms', 'nfc') == 'Yes'
        phone.comms_radio       = data.dig('comms', 'radio')
        phone.comms_usb         = data.dig('comms', 'usb')

        phone.features_sensors = data.dig('features', 'sensors')

        phone.colors = data['colors'] || []
        phone.models = data['models'] || []

        # cameras
        main_cam = data.dig('cameras', 'mainCamera') || {}
        phone.cameras_main_type           = main_cam['type']
        phone.cameras_main_camera_specs   = main_cam['cameraSpecs'] || []
        phone.cameras_main_features       = main_cam['features']    || []
        phone.cameras_main_video          = main_cam['video']       || []

        self_cam = data.dig('cameras', 'selfieCamera') || {}
        phone.cameras_selfie_type          = self_cam['type']
        phone.cameras_selfie_camera_specs  = self_cam['cameraSpecs'] || []
        phone.cameras_selfie_features      = self_cam['features']    || []
        phone.cameras_selfie_video         = self_cam['video']       || []

        phone.save!

        pp "#{phone.name} Saved!"
      end
  end
end

import_phones


# # 1️⃣ Build the URI
# phones_uri = URI("https://mobile-devices-api1.p.rapidapi.com/devices?brandId=66&pageSize=totalItems")

# # 2️⃣ Prepare the GET request with headers
# req = Net::HTTP::Get.new(phones_uri)
# req['X-Rapidapi-Key'] = '51bc23d70dmsh6429272287e5c73p18d54cjsn834e6269ba89'
# req['Accept']         = 'application/json'

# # 3️⃣ Fire the HTTPS request
# res = Net::HTTP.start(phones_uri.hostname, phones_uri.port, use_ssl: true) do |http|
#   http.request(req)
# end

# # 4️⃣ Error check & parse
# unless res.is_a?(Net::HTTPSuccess)
#   puts "⚠️  RapidAPI fetch failed: #{res.code} #{res.message}"
#   exit 1
# end
