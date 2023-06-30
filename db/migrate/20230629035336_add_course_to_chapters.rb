class AddCourseToChapters < ActiveRecord::Migration[7.0]
  def change
    add_reference :chapters, :course, null: false, foreign_key: true
  end
end
