class CreateTraineeTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :trainee_tasks do |t|
      t.integer :status
      t.references :trainee, foreign_key: true
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
