# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rubywednesday_rails2_session',
  :secret      => '841b8003baed10a5ae7d8f0313bce60171258a9ce63bf14361d8015dbd8c1d08b2e4304da6a6390eb9ecb39fba7a57cd4c0eee04081b4c37df66455c436c61c8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
