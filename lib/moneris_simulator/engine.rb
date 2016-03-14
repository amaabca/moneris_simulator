module MonerisSimulator
  class Engine < ::Rails::Engine
    isolate_namespace MonerisSimulator

    config.after_initialize do |app|
      app.routes.prepend do
        mount MonerisSimulator::Engine, at: "moneris"
      end

      app.config.assets.precompile += %w(moneris_simulator/index.js moneris_simulator/index.css)
    end
  end
end
