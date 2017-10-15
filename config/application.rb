<<<<<<< HEAD
#require File.expand_path('../boot', __FILE__)

require_relative 'boot'

require "rails/all"
# Pick the frameworks you want:
#require "active_model/railtie"
#require "active_job/railtie"
#require "active_record/railtie"
#require "action_controller/railtie"
#require "action_mailer/railtie"
#require "action_view/railtie"
#require "sprockets/railtie"
#require "action_cable"
# require "rails/test_unit/railtie"
=======
require_relative 'boot'

require 'rails/all'
>>>>>>> 4e88aef078acde0ac5820730e48df84848eb7a54

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Sistramad
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :es
    
    # Do not swallow errors in after_commit/after_rollback callbacks.
    #config.active_record.raise_in_transactional_callbacks = true

    # autoload lib path
    config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths += Dir["#{config.root}/lib/**/"]

    #predefinir sass
    config.sass.preferred_syntax = :sass
<<<<<<< HEAD
    config.active_job.queue_adapter = :sidekiq
=======


>>>>>>> 4e88aef078acde0ac5820730e48df84848eb7a54
  end
end
