RailsAdmin.config do |config|
  config.main_app_name = ['Keevahh', 'Site Admin']

  config.authorize_with :cancan
  config.current_user_method &:current_user
end
