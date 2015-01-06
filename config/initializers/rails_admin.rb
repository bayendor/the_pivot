RailsAdmin.config do |config|
  config.main_app_name = ['Keevahh', 'Site Admin']

  config.authorize_with :cancan
  config.current_user_method &:current_user

  config.actions do
    dashboard do
      statistics false
    end
    index
    new
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
