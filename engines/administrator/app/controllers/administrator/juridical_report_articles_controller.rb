require_dependency 'administrator/application_controller'

module Administrator
  class JuridicalReportArticlesController < ApplicationController
    before_action :set_juridical_report

    def create
      @juridical_report_article = @juridical_report.articles.new(set_params)
      
      if @juridical_report_article.save
        redirect_to juridical_report_path(@juridical_report)
      else
        render 'administrator/juridical_reports/show', id: @juridical_report
      end
    end

    def destroy
      if @juridical_report.articles.find(params[:id]).destroy
        flash[:success] = t :success
      else
        flash[:danger]  = t :danger
      end

      redirect_to @juridical_report
    end

    private

    def set_juridical_report
      @juridical_report = JuridicalReport.find(params[:juridical_report_id])
    end

    def set_params
      params.require(:juridical_report_article).permit(:article_id)
    end
  end
end