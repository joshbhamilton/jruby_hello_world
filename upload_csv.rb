require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :host    => "localhost",
  :database => "db/development.sqlite3")
  
class Company < ActiveRecord::Base
end

class User < ActiveRecord::Base
end

class Follower < ActiveRecord::Base
end

input_file = File.open("/Users/joshuahamilton/DataMining/twitter_sinatra/company_user.csv", 'r')

input_file.each_line("\n") do |row|
  columns = row.split(",")
  user = Follower.create(
              :company_id => columns[0].to_i, 
              :user_id => columns[1].to_i,
              :created_at => columns[2],
              :updated_at => columns[3]              
              )
end
#@companies = Company.all

#@companies.each do |comp|
#  output_file << comp.id.to_s + "," + comp.screen_name + "," + comp.next_cursor.to_s + "," + comp.created_at.to_s + ", \n"
#end