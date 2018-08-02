class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.text :instruction
      t.string :name

      t.timestamps
    end
  end
end
