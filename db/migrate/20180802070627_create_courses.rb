class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.integer :status ,null: false, default: 0

      t.timestamps
    end
  end
end
