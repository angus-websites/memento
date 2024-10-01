
Hcaptcha.configure do |config|
  config.site_key = ENV["HCAPTCHA_SITE_KEY"]
  config.secret_key = ENV["HCAPTCHA_SECRET_KEY"]
end
