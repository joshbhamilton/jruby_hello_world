class Follower < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  
  validates_uniqueness_of :company_id, :scope => :user_id, :message => "can only follow once"
end
