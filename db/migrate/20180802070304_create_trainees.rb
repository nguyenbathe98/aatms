class CreateTrainees < ActiveRecord::Migration[5.2]
  def change
    create_table :trainees do |t|
      t.string :name
      t.boolean :sex
      t.string :phone
      t.text :address

      t.timestamps
    end
  end
end
