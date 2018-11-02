class CreateNotificationStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :notification_statuses do |t|
      t.integer :status, null: false, default: 0
      t.references :notification, foreign_key: true
      t.references :course_trainee, foreign_key: true

      t.timestamps
    end
  end
end
