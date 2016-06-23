module Administrator
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    layout 'administrator/application'
  end
end
