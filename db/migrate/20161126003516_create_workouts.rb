class CreateWorkouts < ActiveRecord::Migration[5.0]
  def change
    create_table :workouts do |t|
      t.string :mood
      t.string :length
      t.string :title
      t.datetime :date
      t.references :user, index: true, foreign_key: true
      t.references :workout_types, index: true, foreign_key: true
      t.timestamps
    end
  end
end
