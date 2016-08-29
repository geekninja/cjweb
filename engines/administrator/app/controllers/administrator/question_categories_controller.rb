require_dependency 'administrator/application_controller'

module Administrator
  class QuestionCategoriesController < ApplicationController
    before_action :set_question_category, only: [:show, :edit, :update, :destroy]

    def index
      @question_categories = QuestionCategory.all.order('id DESC')
    end

    def new
      @question_category  = QuestionCategory.new 
    end

    def create
      @question_category  = QuestionCategory.new(set_params)

      if @question_category.save
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def edit
    end

    def update

      if @question_category.update(set_params)
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end

    end

    def destroy
      if @question_category.destroy 
        flash[:success] = t :success
      else
        flash[:danger]  = t :danger
      end

      redirect_to action: :index
    end

    private

    def set_params
      params.require(:question_category).permit(:name, :status)
    end


    def set_question_category
      @question_category = QuestionCategory.find(params[:id])
    end
  end
end
