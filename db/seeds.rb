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
require 'phones_uri'
require 'json'

brands_uri = "https://mobile-devices-api1.p.rapidapi.com/brands?pageSize=totalItems"
req = Net::HTTP::Get.new(brands_uri)
req['X-Rapidapi-Key'] = '51bc23d70dmsh6429272287e5c73p18d54cjsn834e6269ba89'
req['Accept']         = 'application/json'

res = Net::HTTP.start(brands_uri.hostname, brands_uri.port, use_ssl: true) do |http|
  http.request(req)
end

brands_json = JSON.parse(res.body)['items'] || []




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

