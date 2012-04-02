module MobileDetection
  module Detection
    extend ActiveSupport::Concern

    included do
      before_filter :check_for_mobile_request
      helper_method :mobile_browser?
      helper_method :mobile_request?
    end

    def check_for_mobile_request
      if mobile_request?
        prepend_view_path Rails.root + 'app/views/mobile'
        cookies[:mobile] = 'true'
      end

      if defined? ChromeHelpers::TemplateResolver
        view_paths.each do |view_path|
          if view_path.is_a? ChromeHelpers::TemplateResolver
            view_path.mobile = (cookies[:mobile] == 'true')
          end
        end
      end
    end

    def mobile_browser?
      request.user_agent =~ /Mobile|webOS|Android/ && !request.user_agent.include?('iPad')
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
