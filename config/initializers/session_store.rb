# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_wikiengine_session',
  :secret      => '83e43126d9e7c44a80757b02c7080c59837f3ab264b82cfa2fdcd9bd26792986f3f92b651bfed64b986937e3b722db392984090b0cb9a387b7e4b8e0bdfd834b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
