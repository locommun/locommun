class Comment < ActiveRecord::Base

  attr_accessible :name, :project_id, :text
  belongs_to :project
  validates_presence_of :text

end
