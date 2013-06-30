class Appointment < ActiveRecord::Base
  attr_accessible :project_id, :datetime, :description
  belongs_to :project
  has_many :date_time_suggestions
end
