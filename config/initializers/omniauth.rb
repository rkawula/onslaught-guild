Rails.application.config.middleware.use OmniAuth::Builder do
	provider :bnet, ENV['BNET_KEY'], ENV['BNET_SECRET']
end