Rails.application.config.middleware.use OmniAuth::Builder do 
    provider :google_oauth2, ENV['GOOGLE_CLIENT_KEY'], ENV['GOOGLE_CLIENT_SECRET']
end 

# middleware intercepts GET/POST requests and alterting that request 