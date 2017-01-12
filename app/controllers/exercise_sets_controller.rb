class ExerciseSetsController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :get_workout_exercise_set, only: [:edit, :update, :destroy]

  def new
    @workout = Workout.find(params[:workout_id])
    @exercise = Exercise.find(params[:exercise_id])
    @set = @exercise.exercise_sets.build
  end

  def create
    @workout = Workout.find(params[:workout_id])
    @exercise = Exercise.find(params[:exercise_id])
    @set = @exercise.exercise_sets.build(set_params)
    if @set.save
      flash[:success] = "Set Created!"
      redirect_to workout_exercise_path(@workout, @exercise)
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @set.update_attributes(set_params)
      flash[:success] = "You've updated set number " + @set.number.to_s + "!" 
      redirect_to workout_exercise_path(@workout, @exercise)
    else
      render 'edit'
    end
  end

  def destroy
    @set.destroy
    flash[:success] = "Set deleted!"
    redirect_to workout_exercise_path(@workout, @exercise)
  end

  private
    def set_params
      params.require(:exercise_set).permit(:number, :reps, :weight, :exercise_id)
    end

    def get_workout_exercise_set
      @workout = Workout.find(params[:workout_id])
      @exercise = @workout.exercises.find(params[:exercise_id])
      @set = @exercise.exercise_sets.find(params[:id])
    end
end
