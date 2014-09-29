Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  provider :facebook, '537909196342016', '9999daaa209fda9b3fdd7f3dfaa66d1a'
end