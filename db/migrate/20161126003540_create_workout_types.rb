class CreateWorkoutTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :workout_types do |t|

      t.timestamps
    end
  end
end