require_dependency 'administrator/application_controller'

module Administrator
  class JuridicalReportsController < ApplicationController
    before_action :set_juridical_report, only: [:edit, :show,:update, :destroy]
    def index
      @juridical_reports = JuridicalReport.all.order('date DESC')
    end

    def new
      @juridical_report  = JuridicalReport.new 
    end

    def create
      @juridical_report  = JuridicalReport.new(set_params)
      if @juridical_report.save
        flash[:success] =  t :success
        redirect_to action: :show, id: @juridical_report
      else
        render action: :new
      end
    end

    def show
      @juridical_report_article = @juridical_report.articles.new
    end

    def edit
    end
    
    def update
      if @juridical_report.update(set_params) 
        flash[:success] =  t :success
        redirect_to action: :index
      else
        render action: :edit
      end
    end

    def destroy
      if @juridical_report.destroy
        flash[:success] = t :success
      else
        flash[:danger] = t :danger
      end

      redirect_to action: :index
    end

    private

    def set_params
      params.require(:juridical_report).permit(:name, :description, :date, :code,
                                               :situation, :publish, :special, :file_path)
    end

    def set_juridical_report
      @juridical_report = JuridicalReport.find(params[:id])
    end
  end
end