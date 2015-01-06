RailsAdmin.config do |config|
  config.main_app_name = Proc.new { |controller| [ "Keevahh", "Site Administration - #{controller.params[:action].try(:titleize)}" ] }

  config.authorize_with :cancan
  config.current_user_method &:current_user
end
