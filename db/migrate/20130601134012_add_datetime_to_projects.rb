class AddDatetimeToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :datetime, :datetime
  end
end
