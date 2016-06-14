require_dependency 'portal/application_controller'

module Portal
  class ArticlesController < ApplicationController


    def index
      @articles = MigrateArticle.all
    end

    def show
      @article = MigrateArticle.find(params[:id])
    end
  end
end
