class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :topic
      t.string :subtopic

      t.timestamps
    end
  end
end
