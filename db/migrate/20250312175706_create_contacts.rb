class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.string :email
      t.string :phone
      t.string :linkedin
      t.string :bio
      t.integer :application_id
      t.string :company

      t.timestamps
    end
  end
end
