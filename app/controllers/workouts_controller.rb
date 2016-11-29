class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @workouts = Workout.all
  end

  def show
    @exercises = @workout.exercises
  end

  def new
    @workout = current_user.workouts.build
  end

  def create
    @workout = current_user.workouts.build(workout_params)

    respond_to do |format|
      if @workout.save
        format.html { redirect_to workout_path(@workout), info: "You have successfully created a new workout." }
        format.json { render :show, status: :created, location: @workout }
      else
        format.html { render :new }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    if @workout.update_attributes(workout_params)
      flash[:success] = "Workout updated!"
      redirect_to @workout
    else
      render 'edit'
    end
  end

  def destroy
    @workout.destroy
    respond_to do |format|
      format.html { redirect_to workouts_path, notice: "Workout was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    def set_workout
      @workout = Workout.find(params[:id])
    end

    def workout_params
      params.require(:workout).permit(:title, :date, :begin, :end, :mood, :workout_type_id)
    end

    def correct_user
      @workout = current_user.workouts.find_by(id: params[:id])
      redirect_to root_url if @workouts.nil?
    end
end
