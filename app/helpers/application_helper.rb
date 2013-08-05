module ApplicationHelper
	def total(student)
		@exam_id = params[:exam_id]
		total = 0
		student.marks.where(exam_id: @exam_id).each do |record|
			total += record.th_mark if record.th_mark
			total += record.pr_mark if record.pr_mark
		end
		#total = number_with_precision(total, precision: 1)
		return total
	end

	def class_highest(subject)
		max = Array.new()
		subject.marks.where(exam_id: params[:exam_id]).each do |subject|
			max << (subject.th_mark.to_i + subject.pr_mark.to_i)
		end
		return max.max
	end

	def percent(student)
		full_mark = 0
		@required_marks = Mark.where("exam_id = ? AND standard_id = ? AND student_id = ?",params[:exam_id], params[:standard_id], student.id)
		# subject_ids = get_ids(@required_marks, "subject_id")
		subject_ids = @required_marks.map{|r| r.subject_id}
		Mark.where("student_id = ? AND exam_id = ? AND standard_id = ? AND subject_id IN (?)", student.id, params[:exam_id], params[:standard_id], subject_ids).each do |mark|
			full_mark += mark.subject.full_mark
		end
		percent = ((total(student).to_f / full_mark) * 100)
		return percent
	end	
	def remarks(student)
		if percent(student) > 90
			remark = "Absolutely Wonderful! "
		elsif percent(student) > 85
			remark = "Excellent! Keep It Up!"
		elsif percent(student) > 80
			remark = "Very Good! Keep It Up!"
		elsif percent(student) > 70
			remark = "Good! You have potentials to achieve higher!"
		elsif percent(student) > 60
			remark = "Well done! The results could have been lot better with more efforts."
		elsif percent(student) > 40
			remark = "You need to work a lot more on your studies."
		else
			remark = "We are very disappointed. You need to do a lot better than this."
		end
		return remark
	end

	def division(student)
		if pass_all_subjects(student)
			if percent(student) > 80
				division = "Distinction"
			elsif percent(student) > 65
				division = "First"
			elsif percent(student) > 50
				division = "Second"
			elsif percent(student) > 40
				division = "Third"
			end
		else
			division = "No Division!"
		end
		return division
	end

	def peers()
		@peers = @students
		@peer_info = Array.new()
		@peers.each do |peer|
			if pass_all_subjects(peer)
				@peer_info << {:student_id => peer.id, :total => total(peer), :position => nil }
			end
		end 
		@peer_info.sort_by!{|a| -a[:total]}
		@peer_count = @peer_info.count
		counter = 0 #the counter for the loop to assign position to all students
		position = 1 #position starts with first
		while counter < (@peer_count) do # as long as every one is not assigned a rank
			@peer_info[counter][:position] = position #assign rank to first student
			## same_position_counter = 1                 #one student has this rank initially
			#if the current student isn't the last && the next student has same total 
			while( counter+1 != @peer_count && @peer_info[counter][:total] == @peer_info[counter+1][:total]) do  
				@peer_info[counter+1][:position] = position    #assign the same position
				## these lines are there if position skips when two people score equal total
				## same_position_counter += 1  #now one more student has the same position
				counter += 1  #switch to next student to check position
			end

			position += 1 ## ( += same_position_counter)  	#the next student will be assigned position accordingly
			counter += 1
		end
		@peer_info.sort_by!{|a| a[:student_id]}
		return @peer_info
	end

	def remark()

	end

	def result(student)
		if pass_all_subjects(student)
			return "PASS"
		else
			return "FAIL"
		end
	end

	def pass_all_subjects(student)
		@exam_id = params[:exam_id]
		@subjects.each do |subject|
			subject_mark = student.marks.where(subject_id: subject.id, exam_id: @exam_id)[0]
			if subject_mark
				obtained_mark = subject_mark.th_mark
				pass_mark = subject.pass_mark
				if obtained_mark.to_i < pass_mark
					return false
				end
			end
		end
		return true
	end


end
