Geocoder.configure do |config|
  config.lookup = :google
  config.api_key = ENV["GOOGLE_MAP_API_KEY"]
  config.use_https = true
  config.units = :km
end