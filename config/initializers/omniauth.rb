Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '465454280146210', '969ae2be2b8212715f0a5c299f062192'
end