# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Lifespan::Application.initialize!


Twitter.configure do |config|
  config.consumer_key = "BQNO5N3UYzWRXeLyRdwg"
  config.consumer_secret = "wXjzMGkhzKHOT5eUV6CzcXKuXxM6ZGktrCBBOKaG4"
  config.oauth_token = "1271919566-df5d29vJ8BUUZD1MIKJEgKRyb8mMeieCZ1gEYLX"
  config.oauth_token_secret = "GpSLAj1GcHFR4SAraXvUTRvuVvUzEO8qbwftrBWHUTA"
end
