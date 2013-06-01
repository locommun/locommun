class ProjectsController < InheritedResources::Base

  before_filter :build_map , :only => [:new,:create]
  before_filter :map , :only => [:show,:edit,:update]
  before_filter :authenticate_user! , :except => [:show,:index]

  respond_to :js, :only => :index


  def index
    letters = ('A'..'Z').to_a
    @json = collection.to_gmaps4rails do |obj, marker|
      url = 'http://www.google.com/intl/en_ALL/mapfiles/marker_green'+ letters.delete_at(0).to_s + '.png'
      marker.json({'picture' =>  url})
    end
    index!
  end

  private

  def build_map
    @json = build_resource.to_gmaps4rails
  end

  def map
    @json = resource.to_gmaps4rails
  end

  def begin_of_association_chain
    current_user
  end

  def collection
    if params[:dragged_location]
      @projects ||= Project.near(params[:dragged_location],params[:dragged_radius], :units => :km).limit(26)
    elsif session[:target_location]
      @projects ||= Project.near(session[:target_location],7, :units => :km).limit(26)
    else
      @projects ||= Project.limit(12)
    end

  end

end