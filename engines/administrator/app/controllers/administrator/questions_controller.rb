require_dependency 'administrator/application_controller'

module Administrator
  class QuestionsController < ApplicationController
    before_action :set_question, only: [:show, :edit, :update, :destroy]

    def index
      @questions = Question.all.order('id DESC')
    end

    def new
      @question  = Question.new 
    end

    def create
      @question  = Question.new(set_params)

      if @question.save
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def edit
    end

    def update

      if @question.update(set_params)
        flash[:success] = t :success
        redirect_to action: :show, id: @question
      else
        render action: :new
      end

    end

    def destroy
      if @question.destroy 
        flash[:success] = t :success
      else
        flash[:danger]  = t :danger
      end

      redirect_to action: :index
    end

    private

    def set_params
      params.require(:question).permit(:description, :observation, :code, :question_category_id, 
                                       :difficulty, :publish, :context, :origin, :tags, 
                                       question_options_attributes: [:description, :correct, :id, :_destroy])
    end


    def set_question
      @question = Question.find(params[:id])
    end
  end
end
