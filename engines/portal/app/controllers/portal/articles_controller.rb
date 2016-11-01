require_dependency 'portal/application_controller'

module Portal
  class ArticlesController < ApplicationController

    has_scope :by_author
    has_scope :by_title
    has_scope :by_category

    def index
      @articles = apply_scopes(Article).all.paginate(:page => params[:page], :per_page => 20)
    end

    def show
      @article = Article.find(params[:id])
    end
  end
end
