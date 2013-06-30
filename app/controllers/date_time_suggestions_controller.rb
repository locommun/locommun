class DateTimeSuggestionsController < InheritedResources::Base
  before_filter :set_project_and_appointment
  
  def create
    create! do |success|
      success.html  {redirect_to project_appointment_path(@project,@appointment)}
    end
  end
  
  def set_project_and_appointment
    @project = Project.find params[:project_id]
    @appointment = Appointment.find params[:appointment_id]
  end
  
  def begin_of_association_chain 
    @appointment
  end
end