class CreateBodyParts < ActiveRecord::Migration[5.0]
  def change
    create_table :body_parts do |t|

      t.timestamps
    end
  end
end
