if defined? Rails
  module MobileDetection
    class Railtie < Rails::Railtie
      initializer "mobile_detection.extend_action_controller" do
        ActiveSupport::on_load :action_controller do
          ActionController::Base.send :include, MobileDetection::Detection
        end
      end
    end
  end
end
