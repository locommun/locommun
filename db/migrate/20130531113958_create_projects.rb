class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps
      t.references :user
      t.timestamps
    end
  end
end
