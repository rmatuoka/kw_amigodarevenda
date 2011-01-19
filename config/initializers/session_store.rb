# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_kw_amigodarevenda_session',
  :secret      => '9560afcca3b0fadce324e9195178e568881c7d43e725234d0493c5875897ff59812c50bb2132cc60fac73ee6c924db17771c9e4a348069203cee0b1910877886'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
