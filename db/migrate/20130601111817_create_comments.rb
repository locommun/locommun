class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.string :name
      t.integer :project_id

      t.timestamps
    end
  end
end
