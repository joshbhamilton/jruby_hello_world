class Company < ActiveRecord::Base
  has_many :followers, :dependent => :destroy
  has_many :users, :through => :followers
  
  
  #validates :screen_name, :uniqueness
  
  def get_followers
    #text = `curl http://api.twitter.com/1/statuses/followers/#{self.screen_name}.xml?cursor=#{next_cursor}`
  end
end
