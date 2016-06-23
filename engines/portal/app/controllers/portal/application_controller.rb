module Portal
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    
    layout 'portal/application'
  end
end
