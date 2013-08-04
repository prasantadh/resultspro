class PagesController < ApplicationController
  def manage
  	if !params[:commit]
  		@exams = Exam.all
  		counter = 0
  		while (counter < @exams.count)
  			@exams[counter] = [@exams[counter].name, @exams[counter].id]
  			counter += 1
  		end
      @exams.sort_by! {|a, b| -b}
  	else
      redirect_to exam_path(params[:exam])
  	end
  end

  def administrate
  end
end
