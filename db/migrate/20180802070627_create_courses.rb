class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.datetime :start_date
      t.datetime :finish_date
      t.integer :status

      t.timestamps
    end
  end
end
