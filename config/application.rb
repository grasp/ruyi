# coding: utf-8
require File.expand_path('../boot', __FILE__)

require "action_controller/railtie"
require "action_mailer/railtie"
require "rails/test_unit/railtie"
require 'sprockets/railtie'


if defined?(Bundler)
  Bundler.require *Rails.groups(:assets => %w(production development test))
end

module RubyChina
  class Application < Rails::Application
    # Custom directories with classes and modules you want to be autoloadable.
    config.autoload_paths += %W(#{config.root}/uploaders)
    config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths += %W(#{config.root}/app/grape)

    config.secret_token = '5070365ffe9d3ad7ed04e0ce080fe7ae9da2bd8497297a695118f91519a4c7b26fce69a024a888e768bacf2e376395921b557ea5cc50999b0e1d86993b908225'
    config.secret_key_base = '66ad08589cd561754c8cd659a5a50a3694904f9c455dd2177115697d12d2c27b873222da8646f34c8cf4598a0f108f12c05141d645a3534c9a9a9833f239f397'

    config.time_zone = 'Beijing'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = "zh-CN"

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password, :password_confirm, :token, :private_token]

    config.mongoid.include_root_in_json = false

    config.assets.enabled = true
    config.assets.version = '1.0'

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => "spec/factories"
    end

    config.to_prepare {
      Devise::Mailer.layout "mailer"
    }
    
    config.assets.precompile += %w(application.css app.js topics.css topics.js window.css front.css cpanel.css search.css
        users.css pages.css pages.js notifications.js notifications.css sites.css sites.js notes.css notes.js 
        gfdynamicfeedcontrol.css gfdynamicfeedcontrol.js mobile.css home.css social-share-button.png social-share-button@2x.png)
  end
end

require "markdown"

I18n.locale = 'zh-CN'



