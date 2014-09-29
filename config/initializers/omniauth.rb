Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  provider :facebook, Rails.application.secrets['facebook']['app_id'], Rails.application.secrets['facebook']['secret']
end