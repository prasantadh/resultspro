class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def get_ids(relation, field)
  	counter = 0
  	ids = Array.new()
    while (counter < relation.count) 
  		if !ids.include?(relation[counter].send(field))
  			ids << relation[counter].send(field)
  		end
  		counter += 1
  	end
  	return ids
  end
end
