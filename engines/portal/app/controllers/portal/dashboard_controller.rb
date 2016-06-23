require_dependency 'portal/application_controller'

module Portal
  class DashboardController < ApplicationController

    def index
      @articles = Article.where(publish: true).limit(6)
      @authors = Author.order('created_at').limit(6)
    end



  end
end
