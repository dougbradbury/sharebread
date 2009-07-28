# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_sharebread_session',
  :secret      => '241be1fc6807e29d33676df526b6b699a228ea7a1cf63151216b0c13b9dd7f8dc522e81de4d687337eaad8a719cb1b909c5353cfcd69aaa9d35cddc51a893876'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
