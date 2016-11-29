class ExercisesController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def show
    @exercise = Exercise.find(params[:id])
  end

  def new
    @workout = Workout.find(params[:workout_id])
    @exercise = @workout.exercises.build
  end

  def create
    @workout = Workout.find(params[:workout_id])
    @exercise = @workout.exercises.build(exercise_params)
    if @exercise.save
      flash[:success] = "Workout created!"
      redirect_to @workout
    else
      render "new"
    end
  end

  private
    def exercise_params
      params.require(:exercise).permit(:name, :body_part_id)
    end
end
