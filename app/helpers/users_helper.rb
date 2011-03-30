module UsersHelper
  def ey_unique_users_percentage
    (@ey_users.length.to_f / @users.length.to_f) * 100
  end
  
  def ey_rails_percentage
    (@ey_rails.length.to_f / @rails_users.length.to_f) * 100
  end
  
  def customers_percentage
    (@customers.length.to_f / @users.length.to_f) * 100
  end
  
  def customers_rails_percentage
    (@customers.length.to_f / @rails_users.length.to_f) * 100
  end
end
