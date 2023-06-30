class CreateChapters < ActiveRecord::Migration[7.0]
  def change
    create_table :chapters do |t|
      t.string :title
      t.integer :number
      t.text :content

      t.timestamps
    end
  end
end
