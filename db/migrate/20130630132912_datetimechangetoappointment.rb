class Datetimechangetoappointment < ActiveRecord::Migration
  def up
    rename_column :date_time_suggestions, :project_id , :appointment_id
     create_table :appointments do |t|
      t.text :description
      t.datetime :datetime
      t.string :project_id

      t.timestamps
    end
  end

  def down
  end
end
