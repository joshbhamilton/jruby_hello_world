class ApplicationController < ActionController::Base
  protect_from_forgery
  
  TWITTER_LIMIT = 150
  
  def number_of_requests
    TWITTER_LIMIT
  end
  
end
