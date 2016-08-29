require_dependency 'portal/application_controller'

module Portal
  class AuthorsController < ApplicationController
    
    has_scope :by_name 
    
    def index
      @authors = apply_scopes(Author).all.paginate(:page => params[:page], :per_page => 20)
    end

  end
end