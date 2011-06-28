module MobileDetection
  module Detection
    extend ActiveSupport::Concern

    included do
      before_filter :check_for_mobile_request
      helper_method :mobile_browser?
      helper_method :mobile_request?
    end

    module InstanceMethods
      def check_for_mobile_request
        if mobile_request?
          prepend_view_path Rails.root + 'app/views/mobile'
          cookies[:mobile] = 'true'
        end
      end

      def mobile_browser?
        request.user_agent =~ /Mobile|webOS|Android/
      end

      def mobile_request?
        cookies[:mobile] = params[:mobile] if params[:mobile]

        if cookies[:mobile]
          cookies[:mobile] == 'true'
        else
          mobile_browser?
        end
      end
    end
  end
end
