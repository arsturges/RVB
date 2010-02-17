# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rvb_session',
  :secret      => '4137f7d970620ec4c93288baa69e576d3c04ffe8dc2621b139674a0e2c2ce644f11cdf23f5144c3987fcefc2cc1e3be23e9d5b9096a9d19c3be6dff9bb0dc49a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
