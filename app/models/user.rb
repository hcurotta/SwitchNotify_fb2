class User < ActiveRecord::Base
  attr_accessible :email, :facebookid
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.facebookid = auth["uid"]
      user.email = auth["info"]["email"]
    end
  end
  
end
