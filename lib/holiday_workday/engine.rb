module HolidayWorkday
  class Engine < ::Rails::Engine
    isolate_namespace HolidayWorkday
    require 'jquery-rails'
    initializer "engine_name.assets.precompile" do |app|
      app.config.assets.precompile << "holiday_workday_manifest.js"
    end
  end
end
