module Subscribem
  class Engine < ::Rails::Engine
    isolate_namespace Subscribem

    # User rspec for tests
    config.generators do |g|
      g.test_framework :rspec, :view_specs => false
    end
  end
end
