class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  def index
    @report_list = Report.where(user_id: current_user.id).page(params[:page])
    @report_list_weight = Report.where(user_id: current_user.id).group_by_day(:created_at, series: false).maximum(:weight)
    @report_list_tired = Report.where(user_id: current_user.id).group_by_day(:created_at, series: false).maximum(:tired)
    @report_list_sleep = Report.where(user_id: current_user.id).group_by_day(:created_at, series: false).maximum(:sleep)
  end

  def show
  end

  def all_report
    @reports = Report.all
  end

  def new
    @report = Report.new
    @user_injury = Injury.where(user_id: current_user.id)
  end

  def edit
  end

  def create
    @report = Report.new(report_params)

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
  end

  def destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_report
    @report = Report.find(params[:id])
  end

  def set_user_report
    @user_report = Report.where(user_id: current_user.id)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def report_params
    params.require(:report).permit(:weight, :tired, :sleep, :nausea, :other, :created_at, :user_id)
  end

end
