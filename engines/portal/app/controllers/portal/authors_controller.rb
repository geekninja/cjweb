require_dependency 'portal/application_controller'

module Portal
  class AuthorsController < ApplicationController
    
    def index
      @authors = Author.all.paginate(:page => params[:page], :per_page => 20)
    end

  end
end