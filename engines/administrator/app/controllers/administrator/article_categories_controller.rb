require_dependency 'administrator/application_controller'

module Administrator
  class ArticleCategoriesController < ApplicationController

    def index
      @article_categories = ArticleCategory.all
    end

    def new
      @article_category = ::ArticleCategory.new
    end

    def create
      @article_category = ::ArticleCategory.new(set_params)

      if @article_category.save
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def edit
    end

    def update
      if @article_category.update(set_params)
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :edit
      end
    end

    def destroy
      if @article_category.destroy
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
      @article_category = ::ArticleCategory.find(params[:id])
    end
  end
end
