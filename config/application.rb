require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestGuru
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.time_zone = 'Minsk'
    config.i18n.default_locale = :ru
    config.i18n.available_locales = [:ru, :en]
    config.autoload_paths << Rails.root.join('app/services')
  end
end
