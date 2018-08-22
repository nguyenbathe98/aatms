class AddInstructionToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :instruction, :text
  end
end
