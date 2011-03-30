class User < ActiveRecord::Base
  has_many :followers, :dependent => :destroy
  has_many :companies, :through => :followers
  validate :tweet_id, :unique => :true
  
  def self.get_urls(users)
    @urls = Array.new
    users.each do |user|
      if user.url.blank? then
        puts ""
      else
        @urls << user.url.gsub('www.','')
      end
    end
    @urls = @urls.uniq.sort
  end
end
