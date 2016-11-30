class ExerciseSetsController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]

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

  def destroy
    @workout = Workout.find(params[:workout_id])
    @exercise = @workout.exercises.find(params[:exercise_id])
    @set = @exercise.exercise_sets.find(params[:id])
    @set.destroy
    flash[:success] = "Set deleted!"
    redirect_to workout_exercise_path(@workout, @exercise)
  end

  private
    def set_params
      params.require(:exercise_set).permit(:number, :reps, :weight, :exercise_id)
    end
end
