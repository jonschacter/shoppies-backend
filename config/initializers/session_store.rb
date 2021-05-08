Rails.application.config.session_store :cookie_store, {
  :key => '_application_session',
  :domain => :all,
  :samesite => :none,
  :secure => :true,
  :tld_length => 2
}