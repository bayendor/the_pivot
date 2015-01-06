RailsAdmin.config do |config|
  config.main_app_name = Proc.new { |controller| [ "Keevahh", "Site Administration - #{controller.params[:action].try(:titleize)}" ] }

  config.authorize_with do
    redirect_to main_app.root_path unless current_user.try(:admin?)
  end
end
