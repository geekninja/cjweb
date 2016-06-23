require_dependency 'administrator/application_controller'

module Administrator
  class AuthorsController < ApplicationController
    before_action :set_author, only: [:show, :edit, :update, :destroy]

    has_scope :by_name

    def index
      @authors = apply_scopes(Author).all.order('created_at DESC').paginate(:page => params[:page], :per_page => 20)
    end
    def show

    end

    def new
      @author = Administrator::Author.new
    end

    def create
      @author = Administrator::Author.new(set_params)

      if @author.save
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def edit
    end

    def update
      if @author.update(set_params)
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :edit
      end
    end

    def destroy
      if @author.destroy
        flash[:success] = t :success
      else
        flash[:danger] = t :danger
      end

      redirect_to action: :index
    end

    private

    def set_params
      params.require(:author).permit(:name, :avatar)
    end

    def set_author
      @author = Administrator::Author.find(params[:id])
    end
  end
end
