class MusclesController < ApplicationController
  before_action :set_muscle, only: [:show, :edit, :update, :destroy]
  before_action :set_user_muscle, only: [:user_muscle]

  # GET /muscles
  # GET /muscles.json
  def index
    @muscles = Muscle.all
    @user_injury = Injury.where(user_id: current_user.id)
  end

  def user_muscle
    @muscles_list = Muscle.where(user_id: current_user.id).page(params[:page])
    @user_muscle_benchpress = Muscle.where(user_id: current_user.id).group_by_day(:created_at, series: false).maximum(:benchpress)
    @user_muscle_squat = Muscle.where(user_id: current_user.id).group_by_day(:created_at, series: false).maximum(:squat)
    @user_muscle_chinup = Muscle.where(user_id: current_user.id).group_by_day(:created_at, series: false).maximum(:chin_up)
    @user_muscle_deadlift = Muscle.where(user_id: current_user.id).group_by_day(:created_at, series: false).maximum(:deadlift)
  end

  # GET /muscles/1
  # GET /muscles/1.json
  def show
  end

  # GET /muscles/new
  def new
    @muscle = Muscle.new
  end

  # GET /muscles/1/edit
  def edit
  end

  # POST /muscles
  # POST /muscles.json
  def create
    @muscle = Muscle.new(muscle_params)

    respond_to do |format|
      if @muscle.save
        Slack.chat_postMessage(text: 'hello!', username: 'slack_test_bot', channel: "#test")
        format.html { redirect_to @muscle, notice: 'Muscle was successfully created.' }
        format.json { render :show, status: :created, location: @muscle }
      else
        format.html { render :new }
        format.json { render json: @muscle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /muscles/1
  # PATCH/PUT /muscles/1.json
  def update
    respond_to do |format|
      if @muscle.update(muscle_params)
        format.html { redirect_to @muscle, notice: 'Muscle was successfully updated.' }
        format.json { render :show, status: :ok, location: @muscle }
      else
        format.html { render :edit }
        format.json { render json: @muscle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /muscles/1
  # DELETE /muscles/1.json
  def destroy
    @muscle.destroy
    respond_to do |format|
      format.html { redirect_to muscles_url, notice: 'Muscle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_muscle
      @muscle = Muscle.find(params[:id])
    end

    def set_user_muscle
      @user_muscle = Muscle.where(user_id: current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def muscle_params
      params.require(:muscle).permit(:benchpress, :squat, :chin_up, :deadlift, :user_id, :created_at)
    end
end
