class InjuriesController < ApplicationController
  before_action :set_injury, only: [:show, :edit, :update, :destroy, :heal]

  def index
    @injury_list = Injury.where(user_id: current_user.id).page(params[:page])
  end

  def injuries_index
    @injury_list = Injury.where(user_id: current_user.id).page(params[:page])
  end

  def show
  end

  def new
    @injury = Injury.new
    @user_injury = Injury.where(user_id: current_user.id)
  end

  def edit
  end

  def heal
    @user_injury = Injury.where(user_id: current_user.id)
  end

  def create
    @injury = Injury.new(injury_params)

    respond_to do |format|
      if @injury.save
        format.html { redirect_to @injury, notice: 'Injury was successfully created.' }
        format.json { render :show, status: :created, location: @injury }
      else
        format.html { render :new }
        format.json { render json: @injury.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
  end

  def destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_injury
    @injury = Injury.find(params[:id])
  end

  def set_user_injury
    @user_injury = Injury.where(user_id: current_user.id)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def injury_params
    params.require(:injury).permit(:part, :heal, :created_at, :user_id)
  end

end
