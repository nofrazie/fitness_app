class ExercisesController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_workout_and_exercise, only: [:show, :edit, :update, :destroy]

  def show
    @sets = @exercise.exercise_sets
  end

  def new
    @workout = Workout.find(params[:workout_id])
    @exercise = @workout.exercises.build
  end

  def create
    @workout = Workout.find(params[:workout_id])
    @exercise = @workout.exercises.build(exercise_params)
    if @exercise.save
      flash[:success] = "Exercise created!"
      redirect_to @workout
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @exercise.update_attributes(exercise_params)
      flash[:success] = "This exercise has been updated!"
      redirect_to workout_exercise_path(@workout, @exercise)
    else
      render 'edit'
    end
  end

  def destroy
    @exercise.destroy
    flash[:success] = "Exercise deleted"
    redirect_to workout_path(@workout)
  end

  private
    def exercise_params
      params.require(:exercise).permit(:name, body_part_ids:[])
    end

    def set_workout_and_exercise
      @workout = Workout.find(params[:workout_id])
      @exercise = @workout.exercises.find_by_id(params[:id])
    end
end
