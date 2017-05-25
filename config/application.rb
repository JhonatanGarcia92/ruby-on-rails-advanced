require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    I18n.enforce_available_locales = false
    config.i18n.default_locale = :pt

    config.middleware.insert_before 0, "Rack::Cors", :debug => true, :logger => ( -> { Rails.logger }) do
      allow do
        origins '*'

        resource '*',
          :headers => :any,
          :methods => [:get, :post, :delete, :put, :options],
          :max_age => 0
      end
    end
  end
end
