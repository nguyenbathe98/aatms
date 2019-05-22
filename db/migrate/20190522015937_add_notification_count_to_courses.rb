class AddNotificationCountToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :notification_count, :int, default: 0
  end
end
