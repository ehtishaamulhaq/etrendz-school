require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.



Bundler.require(*Rails.groups)

module An
  class Application < Rails::Application

    config.i18n.default_locale = :en
    config.autoload_paths += Dir["#{Rails.root}/lib/**/"]
    config.autoload_paths << Rails.root.join('app', 'models', 'hr')
    config.autoload_paths << Rails.root.join('app', 'models', 'finance')
#     config.autoload_paths << Rails.root.join('app', 'models', 'student.rb')
        config.autoload_paths += %W(#{Rails.root.join('app', 'models', 'student.rb')})

    # Line added to fix circular dependency error while loading student
    config.middleware.delete Rack::Lock
    config.reload_classes_only_on_change = true
    config.active_record.raise_in_transactional_callbacks = true

  end
end
