class AppointmentsController < InheritedResources::Base
  before_filter :set_project
  
  def set_project
    @project = Project.find params[:project_id]
  end
  
  def begin_of_association_chain 
    @project
  end
    
end