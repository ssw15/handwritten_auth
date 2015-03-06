require 'open-uri'

class AuthController < ApplicationController
  def facebook
    code = params[:code]
    app_id = "149705581903855"
    app_secret = "f559de1bb02c4864cd297a06187e7369"
    callback_url = "http://localhost:3000/facebook/callback"

    url = "https://graph.facebook.com/oauth/access_token?client_id=#{app_id}&redirect_uri=#{callback_url}&client_secret=#{app_secret}&code=#{code}"

    result = open(url).read

    token = result.split('&').first.split('=').last

    current_user.facebook_access_token = token
    current_user.save

    redirect_to current_user, :notice => "Thanks!"
  end
end
