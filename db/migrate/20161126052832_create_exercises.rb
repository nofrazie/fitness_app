class CreateExercises < ActiveRecord::Migration[5.0]
  def change
    create_table :exercises do |t|
      t.belongs_to :workout, index: true
      t.string :name
      t.timestamps
    end
  end
end
