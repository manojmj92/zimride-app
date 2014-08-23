# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_auth_logic_implementation_session',
  :secret      => 'b57b56ad9224ac371115d296c60b866351acaf0fe76b9dcefc010bc24d1cb7850eb7cf05d8eac6ab8cf9e4a916bb9ac5ba50cdde5449367d11797465062acd95'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
