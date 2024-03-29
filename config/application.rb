require_relative 'boot'

require 'rails/all'


  

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MinhaAgenda
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.middleware.insert_before 0, Rack::Cors do
 
      allow do
      
        origins '*'
      
        resource '*',
      
          headers: :any,
      
          methods: %i(get post put patch delete options head)
      
      end
    end
    config.middleware.use Rack::Attack
  end


end


