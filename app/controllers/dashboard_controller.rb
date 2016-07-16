class DashboardController < ApplicationController
  before_action do
    @current_location = session[:location]

    if @current_location.nil?
      redirect_to new_location_path
    end
  end

  def show
    @current_location = session[:location]

    lat = @current_location["lat"]
    lon = @current_location["lon"]

    url = "https://api.foursquare.com/v2/venues/search?query=pizza&ll=#{lat},#{lon}&oauth_token=GXYXSRMCPNK5DCV0PZJXDILFPPLFYM1GOE4IU2Z5VEGTMEAX&v=20160715"

    json = JSON.parse(Http.get(url).body)

    @venues = json["response"]["venues"]
  end

end
