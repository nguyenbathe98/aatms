class AddDateToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :start_date, :datetime
    add_column :courses, :finish_date, :datetime
  end
end
