class SponsorFinderController < ApplicationController
  def index
    sp = params[:sponsor_finder]
    @project_id = sp["project_id"]
    @project = Project.find @project_id
    @sponsors = findSponsors(@project.latitude, @project.longitude, sp["radius"])
    @sponsorsCount = @sponsors.count
  end
  
  private
  
#    client = GooglePlaces::Client.new('AIzaSyCRZSa5rUrONbmP9e_tuLIVQ8whPO3sFMc')
  PLACES_TYPES = %w[food store]
  
  def findSponsors(alat, alng, aradius)
      client = GooglePlaces::Client.new('AIzaSyCRZSa5rUrONbmP9e_tuLIVQ8whPO3sFMc')
      lat = alat #'52.4578897'
      lng = alng #'13.2966434'
      radius = (aradius.to_i*1000).to_s #"5000" #in meters
      types = PLACES_TYPES
      sponsors = getPlaces(client, lat, lng, radius, types)
  end
  
  def getPlaces(client, lat, lng, aradius, atypes)
    spots = client.spots(lat, lng, radius: aradius, types: atypes)
#  only needed for more spots (>20)
#    nextPageToken = spots.last.nextpagetoken
#    sleep 2
#    spots += getNextPlaces(client, nextPageToken) if nextPageToken
#    return spots
  end
  
  def getNextPlaces(client, nextPageToken)
    spots = client.spots_by_pagetoken(nextPageToken)
    nextPageToken = spots.last.nextpagetoken
    sleep 2
    spots += getNextPlaces(client, nextPageToken) if nextPageToken
    return spots
  end
  
end