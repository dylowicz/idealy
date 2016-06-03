require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Idealy
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # config.browserify_rails.commandline_options = "--transform reactify --extensions .jsx"
    # config.browserify_rails.commandline_options = "-t [ reactify --presets [ es2015 react ] --extensions .es6.jsx ]"
    # config.browserify_rails.commandline_options = "-t [ babelify --presets [ es2015 react ] --extension=\".es6.jsx\" ]"
    config.browserify_rails.commandline_options = "-t reactify --extension=\".es6.jsx\""
  end
end
