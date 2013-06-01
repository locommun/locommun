class DateTimeSuggestion < ActiveRecord::Base
  attr_accessible :project_id, :datetime
  belongs_to :project
  acts_as_voteable
end
