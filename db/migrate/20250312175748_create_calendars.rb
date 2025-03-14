class CreateCalendars < ActiveRecord::Migration[7.1]
  def change
    create_table :calendars do |t|
      t.string :title
      t.datetime :time
      t.string :status
      t.integer :application_id

      t.timestamps
    end
  end
end
