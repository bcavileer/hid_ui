module HidUi
  class Engine < ::Rails::Engine
    isolate_namespace HidUi

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
