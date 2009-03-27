# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_dotinfo_session',
  :secret      => '062cdad83441921301dcc7c671f0366e19441d6bfcc1866146b80138a790851ca261c1f19c63d0a277156073b52ec269a3a6a344934e070ece7796e688d06411'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
