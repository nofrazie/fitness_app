class CreateCompounds < ActiveRecord::Migration[5.0]
  def change
    create_table :compounds do |t|
      t.belongs_to :body_part, index: true
      t.belongs_to :exercise, index: true
      t.timestamps
    end
  end
end
