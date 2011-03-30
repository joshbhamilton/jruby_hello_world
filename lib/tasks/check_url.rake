desc "Grab URLs for User and Check Rails"
task :check_url_id => :environment do
  require 'open-uri'
  u_id = ENV['id']
  @user = User.find(u_id)
  
  puts @user.screen_name
  if @user.url.blank? then
    puts "No URL"
  else
    puts @user.url
    h3_tags = Array.new
    doc = Nokogiri::HTML(open("#{@user.url}"))
    doc.xpath("//fieldset/h3").each do |f|
      p f.text
      h3_tags << f.text
    end
    if h3_tags.include?("Ruby on Rails") then
      puts "RAILS:  #{@user.screen_name}  #{@user.url}"
    else
      puts "NONE:  #{@user.screen_name}  #{@user.url}"
    end
  end
end

desc "Grab URLs for User and Check Rails"
task :check_url_screen_name => :environment do
  require 'open-uri'
  screen_name = ENV['screen_name']
  @company = Company.find_by_screen_name(screen_name)
  @users = @company.users.all
  
  count_i = 0
  
  @users.each do |user|
    puts user.screen_name
    puts count_i.to_s
    if user.url.blank? then
      puts ""
      count_i = count_i + 1
    else
      count_i = count_i + 1
      h3_tags = Array.new
      url = user.url.gsub('http://','')
      begin
        doc = Nokogiri::HTML(open("http://www.builtwith.com/#{url}"))     
        doc.xpath("//h3").each do |f|
          h3_tags << f.text
        end
        if h3_tags.include?("Ruby on Rails") then
          puts "RAILS:  #{user.screen_name}  #{user.url}"
          user.rails = true
          user.save
        else
          puts "NONE:  #{user.screen_name}  #{user.url}"
        end
       rescue
          puts "URL INVALID"
        end
    end
  end
end

desc "Grab URLs for User and Check Rails"
task :check_url_sn_start_with => :environment do
  require 'open-uri'
  screen_name = ENV['screen_name']
  start_with = ENV['start_with'].to_i
  @company = Company.find_by_screen_name(screen_name)
  @users = @company.users.all
  
  @users_to_add = @users - @users[0, start_with]
  count_i = start_with
  
  @users_to_add.each do |user|
    puts user.screen_name
    puts count_i.to_s
    if user.url.blank? then
      puts ""
      count_i = count_i + 1
    else
      count_i = count_i + 1
      h3_tags = Array.new
      url = user.url.gsub('http://','')
      begin
        doc = Nokogiri::HTML(open("http://www.builtwith.com/#{url}"))     
        doc.xpath("//h3").each do |f|
          h3_tags << f.text
        end
        if h3_tags.include?("Ruby on Rails") then
          puts "RAILS:  #{user.screen_name}  #{user.url}"
          user.rails = true
          user.save
        else
          puts "NONE:  #{user.screen_name}  #{user.url}"
        end
       rescue
          puts "URL INVALID"
        end
    end
  end
end

desc "Grab URLs for User and Check Rails"
task :rails_urls => :environment do
  require 'open-uri'
  screen_name = ENV['screen_name']
  @company = Company.find_by_screen_name(screen_name)
  @users = @company.users.all
  count_i = 0
  @users.each do |user|
    puts user.screen_name
    puts count_i.to_s
    if user.url.blank? then
      puts ""
      count_i = count_i + 1
    else
      count_i = count_i + 1
      h3_tags = Array.new
      url = user.url.gsub('http://','')
      begin
        doc = Nokogiri::HTML(open("http://www.builtwith.com/#{url}"))     
        doc.xpath("//h3").each do |f|
          h3_tags << f.text
        end
        if h3_tags.include?("Ruby on Rails") then
          puts "RAILS:  #{user.screen_name}  #{user.url}"
          user.rails = true
          user.save
          RailsUrl.find_or_create_by_url(:url => url, :customer => false, :lead => false)
        else
          puts "NONE:  #{user.screen_name}  #{user.url}"
        end
       rescue
          puts "URL INVALID"
        end
    end
  end
end

desc "Grab URLs for User and Check Rails"
task :import_urls => :environment do
  @users = User.where(:rails => true)

  @users.each do |user|
    puts user.screen_name
    url = user.url.gsub('http://','')
    url = url.gsbu('www.','')
    RailsUrl.find_or_create_by_url(:url => url, :customer => false, :lead => false)
    user.update_attributes(url)
    user.save
  end
end