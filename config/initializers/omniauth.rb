Rails.application.config.middleware.use OmniAuth::Builder do
    provider :twitter, Rails.application.credentials.api_key, Rails.application.credentials.api_key_secret
end