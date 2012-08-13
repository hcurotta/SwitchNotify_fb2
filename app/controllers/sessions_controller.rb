class SessionsController < ApplicationController
  require 'rest_client'
  
  def create
    # raise request.env["omniauth.auth"].to_yaml
    auth = request.env["omniauth.auth"]
    user = User.find_by_facebookid(auth["uid"]) || User.create_with_omniauth(auth)
            
            
    # RestClient.put('http://swtch.co/device/'+device.device_id+'/pulse') do |response|
    RestClient.post 'https://graph.facebook.com/465454280146210/subscriptions?access_token=' +URI.escape('465454280146210|cvSkeD8otfLqTCbXI5NT46O5RyA'), :object => 'user', "callback_url" => "http://mysterious-island-8736.herokuapp.com/", :fields => "feed", "verify_token" => "123" do |response|
      
      if response.code == 200
        # @result = "Success"
        render :text => "success"
      else 
        # @result = "failed with #{response.code}"
        render :text => response.body
      end
    
    end
  end
end
