module Portal
  class JuridicalReportsController < ApplicationController
    
    def index
      @juridical_reports = JuridicalReport.all.paginate(:page => params[:page], :per_page => 20)
    end

    def show
      @juridical_report = JuridicalReport.find(params[:id])
    end


  end
end