require 'fhs'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :FHS,
           ENV['FHS_KEY'],
           ENV['FHS_SECRET'],
           name: 'fhs_full',
           scope: 'identity'
end
