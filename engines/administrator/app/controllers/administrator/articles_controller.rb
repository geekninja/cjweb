require_dependency 'administrator/application_controller'

module Administrator
  class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :destroy]
    
    has_scope :by_title
    has_scope :by_author

    def index
      @articles = apply_scopes(Article).all.order('created_at DESC').paginate(:page => params[:page], :per_page => 20)
    end

    def new
      @article = ::Article.new
    end

    def create
      @article = ::Article.new(set_params)

      if @article.save
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def edit
    end

    def update
      if @article.update(set_params)
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :edit
      end
    end

    def destroy
      if @article.destroy
        flash[:success] = t :success
      else
        flash[:danger] = t :danger
      end

      redirect_to action: :index
    end

    private

    def set_params
      params.require(:article).permit(:title, :content, :publish, :author_id)
    end

    def set_article
      @article = ::Article.find(params[:id])
    end
  end
end