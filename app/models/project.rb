class Project < ActiveRecord::Base
   include Rails.application.routes.url_helpers
  attr_accessible :description, :gmaps, :latitude, :longitude, :title, :image

  belongs_to :user
  has_many :comments
  has_many :date_time_suggestions

  has_attached_file :image, :styles => { :medium => "520x360>", :thumb => "260x180#" , :mini => "130x90#"}

  validates :title, :length => {:minimum => 3, :maximum => 30}
  validates_numericality_of :latitude, {:minimum => 0, :maximum => 90}
  validates_numericality_of :longitude, {:minimum => -180, :maximum => 180}

  acts_as_gmappable :process_geocoding => false

  reverse_geocoded_by :latitude, :longitude

  def gmaps4rails_address
    ""
  end

  def gmaps4rails_infowindow
    if self.id
      head = "<a href=\"#{url_for(project_path(self,:locale => I18n.locale))}\"><h3>#{self.title}</h3></a>"
    else
      ""
    end
  end
end
