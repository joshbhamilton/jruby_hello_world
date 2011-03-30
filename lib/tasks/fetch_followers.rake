desc "Get followers for a given Twitter handle"
task :fetch_followers => :environment do
#task :fetch_followers, [:screen_name]  do |t, args|
#  require 'nokogiri'
  screen_name = ENV['screen_name']
#  puts args.screen_name
  
#  class Company < ActiveRecord::Base
#  end
  
#  class User < ActiveRecord::Base
#  end
  
#  class Follower < ActiveRecord::Base
#  end
  
  @company = Company.find_or_create_by_screen_name(screen_name,
    :next_cursor => -1,
    :created_at => Time.now
    )
  if @company.next_cursor = 0 then
    next_cursor = -1
  else
    next_cursor = @company.next_cursor
  end
  while next_cursor != 0 do
    p "Next Cursor: " + next_cursor.to_s
    text = `curl http://api.twitter.com/1/statuses/followers/#{@company.screen_name}.xml?cursor=#{next_cursor}`
    #puts text
    doc = Nokogiri::XML(text)
    @company.next_cursor = doc.search('//next_cursor').text
    @company.save
    doc.xpath('//user').each do |user|
      #p user.xpath('id').text
      @user = User.find_or_create_by_tweet_id(user.xpath('id').text.to_i,
#       :tweet_id => user.xpath('id').text.to_i,
        :screen_name => user.xpath('screen_name').text,
        :location => user.xpath('location').text,
        :url => user.xpath('url').text,
        :followers_count => user.xpath('followers_count').text.to_i,
        :friends_count => user.xpath('friends_count').text.to_i,
        :time_zone => user.xpath('time_zone').text,
        :rails => 0,
        :customer => 0,
        :created_at => Time.now
      )
      Follower.find_or_create_by_company_id_and_user_id(:company_id => @company.id, :user_id => @user.id)
      next_cursor = @company.next_cursor
    end
  end
end