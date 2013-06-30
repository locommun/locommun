class DateTimeSuggestion < ActiveRecord::Base
  attr_accessible :appointment_id, :datetime
  belongs_to :appointment
  acts_as_voteable
end
