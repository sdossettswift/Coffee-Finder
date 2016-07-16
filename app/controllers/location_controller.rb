require 'cgi'
class LocationController < ApplicationController
  def locate
    @location = params[:location]

    results = JSON.parse(Http.get("http://locationiq.org/v1/search.php?key=926cae16188d91bf07d5&format=json&q=#{CGI::escape(@location)}").body)

    session[:location] = results.first

    redirect_to root_path

  end

  def new
  end

end
