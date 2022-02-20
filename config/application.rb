require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NannaMartins
  class Application < Rails::Application
    config.load_defaults 5.2

    config.active_record.observers = :craft_observer

    config.autoload_paths += %W[
      #{config.root}/lib
    ]

    config.i18n.default_locale = 'pt-BR'
  end
end
