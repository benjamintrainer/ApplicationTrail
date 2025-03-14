class CreateApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :applications do |t|
      t.string :role
      t.text :description
      t.string :status
      t.integer :user_id
      t.string :company
      t.string :location

      t.timestamps
    end
  end
end
