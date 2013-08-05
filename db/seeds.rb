## set up exams
["First Terminal Exam - 2012", "Second Terminal Exam - 2012", "Final Exam - 2012"].each do |exam_name|
	Exam.find_or_create_by_name!(exam_name)
end

## setup standards for that exam
["A2", "A1", "Ten"].each do |standard|
	Standard.find_or_create_by_name!(standard)
end

## setup subjects for first standard of exams
["English", "Nepali", "Maths", "Science", "Social", "Health", "Optional Maths", "Computer", "Account"].each do |subject_name|
	new_subject = Subject.create!(name: subject_name, standard_id: 1, full_mark: 100, pass_mark: 40)
end
["English", "Nepali", "Maths", "Science", "Social", "Health", "Optional Maths", "Computer", "Account"].each do |subject_name|
	new_subject = Subject.create!(name: subject_name, standard_id: 2, full_mark: 100, pass_mark: 40)
end
["English", "Nepali", "Maths", "Science", "Social", "Health", "Optional Maths", "Computer", "Account"].each do |subject_name|
	new_subject = Subject.create!(name: subject_name, standard_id: 3, full_mark: 100, pass_mark: 40)
end
Subject.find(4).update_attributes!(practical: true, practical_full_mark: 25, practical_pass_mark: 10)
Subject.find(13).update_attributes!(practical: true, practical_full_mark: 25, practical_pass_mark: 10)
Subject.find(22).update_attributes!(practical: true, practical_full_mark: 25, practical_pass_mark: 10)

## setup combinations for the first standard
["Computer Group", "Account Group"].each do |subject_combination|
	SubjectCombination.create!(name: subject_combination, standard_id: 1)		
	SubjectCombination.create!(name: subject_combination, standard_id: 2)		
	SubjectCombination.create!(name: subject_combination, standard_id: 3)		
end

##setup students from first standard who appear in the exam
student = Array.new
(0...10).each do |n|
	student[n] = Student.new(roll: n + 1, name: Faker::Name.name)
	(student[n]).standard_id = 1
	if n < 5 
		student[n].subject_combination_id = 1
	else
		student[n].subject_combination_id = 4
	end
	student[n].save
end
(0...10).each do |n|
	student[n] = Student.new(roll: n + 1, name: Faker::Name.name)
	(student[n]).standard_id = 2
	if n < 5 
		student[n].subject_combination_id = 2
	else
		student[n].subject_combination_id = 5
	end
	student[n].save
end
(0...10).each do |n|
	student[n] = Student.new(roll: n + 1, name: Faker::Name.name)
	(student[n]).standard_id = 3
	if n < 5 
		student[n].subject_combination_id = 3
	else
		student[n].subject_combination_id = 6
	end
	student[n].save
end

## create subject combination details
SubjectCombinationDetail.create(standard_id: 1, subject_id: 1, subject_combination_id: 1)
SubjectCombinationDetail.create(standard_id: 1, subject_id: 2, subject_combination_id: 1)
SubjectCombinationDetail.create(standard_id: 1, subject_id: 3, subject_combination_id: 1)
SubjectCombinationDetail.create(standard_id: 1, subject_id: 4, subject_combination_id: 1)
SubjectCombinationDetail.create(standard_id: 1, subject_id: 5, subject_combination_id: 1)
SubjectCombinationDetail.create(standard_id: 1, subject_id: 6, subject_combination_id: 1)
SubjectCombinationDetail.create(standard_id: 1, subject_id: 7, subject_combination_id: 1)
SubjectCombinationDetail.create(standard_id: 1, subject_id: 1, subject_combination_id: 4)
SubjectCombinationDetail.create(standard_id: 1, subject_id: 2, subject_combination_id: 4)
SubjectCombinationDetail.create(standard_id: 1, subject_id: 3, subject_combination_id: 4)
SubjectCombinationDetail.create(standard_id: 1, subject_id: 4, subject_combination_id: 4)
SubjectCombinationDetail.create(standard_id: 1, subject_id: 5, subject_combination_id: 4)
SubjectCombinationDetail.create(standard_id: 1, subject_id: 6, subject_combination_id: 4)
SubjectCombinationDetail.create(standard_id: 1, subject_id: 7, subject_combination_id: 4)
SubjectCombinationDetail.create(standard_id: 1, subject_id: 8, subject_combination_id: 1)
SubjectCombinationDetail.create(standard_id: 1, subject_id: 9, subject_combination_id: 4)

SubjectCombinationDetail.create(standard_id: 2, subject_id: 10, subject_combination_id: 2)
SubjectCombinationDetail.create(standard_id: 2, subject_id: 11, subject_combination_id: 2)
SubjectCombinationDetail.create(standard_id: 2, subject_id: 12, subject_combination_id: 2)
SubjectCombinationDetail.create(standard_id: 2, subject_id: 13, subject_combination_id: 2)
SubjectCombinationDetail.create(standard_id: 2, subject_id: 14, subject_combination_id: 2)
SubjectCombinationDetail.create(standard_id: 2, subject_id: 15, subject_combination_id: 2)
SubjectCombinationDetail.create(standard_id: 2, subject_id: 16, subject_combination_id: 2)
SubjectCombinationDetail.create(standard_id: 2, subject_id: 10, subject_combination_id: 5)
SubjectCombinationDetail.create(standard_id: 2, subject_id: 11, subject_combination_id: 5)
SubjectCombinationDetail.create(standard_id: 2, subject_id: 12, subject_combination_id: 5)
SubjectCombinationDetail.create(standard_id: 2, subject_id: 13, subject_combination_id: 5)
SubjectCombinationDetail.create(standard_id: 2, subject_id: 14, subject_combination_id: 5)
SubjectCombinationDetail.create(standard_id: 2, subject_id: 15, subject_combination_id: 5)
SubjectCombinationDetail.create(standard_id: 2, subject_id: 16, subject_combination_id: 5)
SubjectCombinationDetail.create(standard_id: 2, subject_id: 17, subject_combination_id: 2)
SubjectCombinationDetail.create(standard_id: 2, subject_id: 18, subject_combination_id: 5)

SubjectCombinationDetail.create(standard_id: 3, subject_id: 19, subject_combination_id: 3)
SubjectCombinationDetail.create(standard_id: 3, subject_id: 20, subject_combination_id: 3)
SubjectCombinationDetail.create(standard_id: 3, subject_id: 21, subject_combination_id: 3)
SubjectCombinationDetail.create(standard_id: 3, subject_id: 22, subject_combination_id: 3)
SubjectCombinationDetail.create(standard_id: 3, subject_id: 23, subject_combination_id: 3)
SubjectCombinationDetail.create(standard_id: 3, subject_id: 24, subject_combination_id: 3)
SubjectCombinationDetail.create(standard_id: 3, subject_id: 25, subject_combination_id: 3)
SubjectCombinationDetail.create(standard_id: 3, subject_id: 19, subject_combination_id: 6)
SubjectCombinationDetail.create(standard_id: 3, subject_id: 20, subject_combination_id: 6)
SubjectCombinationDetail.create(standard_id: 3, subject_id: 21, subject_combination_id: 6)
SubjectCombinationDetail.create(standard_id: 3, subject_id: 22, subject_combination_id: 6)
SubjectCombinationDetail.create(standard_id: 3, subject_id: 23, subject_combination_id: 6)
SubjectCombinationDetail.create(standard_id: 3, subject_id: 24, subject_combination_id: 6)
SubjectCombinationDetail.create(standard_id: 3, subject_id: 25, subject_combination_id: 6)
SubjectCombinationDetail.create(standard_id: 3, subject_id: 26, subject_combination_id: 3)
SubjectCombinationDetail.create(standard_id: 3, subject_id: 27, subject_combination_id: 6)
#setup mark archives
(1..3).each do |p|
	(1..30).each do |q|
		(1..27).each do |r|
	        if Student.find(q).standard.subject_combinations != []  ## if the standard has subject combinations
	          if Student.find(q).subject_combination.subjects.include?(Subject.find(r))  ##for the subjects taken by student
	  			   Mark.create(exam_id: p, standard_id: Student.find(q).standard.id, student_id: q, subject_id: r, th_mark: rand(40..99))   	
	          end
	        else  ## if the standard does not have subject combinations
	          if Student.find(q).standard.subjects.include? Subject.find() ## if the subject belongs to the student's standard
	            Mark.create(exam_id: p, standard_id: Student.find(q).standard.id, student_id: q, subject_id: r, th_mark: rand(40..99)) 
	          end
	        end
		end
	end
end

# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# #
# # Examples:
# #
# #   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# #   Mayor.create(name: 'Emanuel', city: cities.first)


# # ["A2", "A1", "Ten", "Nine", "Eight", "Seven"].each do |standard|
# # 	Standard.find_or_create_by_name(standard)
# # end
# # student = Array.new
# # (0...10).each do |n|
# # 	student[n] = Student.new(roll: n, name: "Student #{n}")
# # 	(student[n]).standard_id = 1
# # 	if n <= 5 
# # 		student[n].subject_combination_id = 1
# # 	else
# # 		student[n].subject_combination_id = 4
# # 	end
# # 	(student[n]).save
# # end
# # (0...10).each do |n|
# # 	student[n] = Student.new(roll: n, name: "Student #{n+10}")
# # 	(student[n]).standard_id = 2
# # 	if n <= 5 
# # 		student[n].subject_combination_id = 2
# # 	else
# # 		student[n].subject_combination_id = 5
# # 	end
# # 	(student[n]).save
# # end
# # (0...10).each do |n|
# # 	student[n] = Student.new(roll: n, name: "Student #{n + 20}")
# # 	(student[n]).standard_id = 3
# # 	if n <= 5 
# # 		student[n].subject_combination_id = 3
# # 	else
# # 		student[n].subject_combination_id = 6
# # 	end
# # 	(student[n]).save
# # end
# # ["English", "Nepali", "Maths", "Science", "Social"].each do |subject_name|
# # 	new_subject = Subject.new(name: subject_name, standard_id: 1, full_mark: 100, pass_mark: 40)
# # 	new_subject.save	
# # 	new_subject = Subject.new(name: subject_name, standard_id: 2, full_mark: 100, pass_mark: 40)
# # 	new_subject.save	
# # 	new_subject = Subject.new(name: subject_name, standard_id: 3, full_mark: 100, pass_mark: 40)
# # 	new_subject.save
# # end

# # ["First Terminal Exam - 2012", "Second Terminal Exam - 2012", "Final Exam - 2012"].each do |exam_name|
# # 	Exam.find_or_create_by_name(exam_name)
# # end

# # ["Science Group", "Humanities Group"].each do |subject_combination|
# # 	SubjectCombination.create(name: subject_combination, standard_id: 1)		
# # 	SubjectCombination.create(name: subject_combination, standard_id: 2)		
# # 	SubjectCombination.create(name: subject_combination, standard_id: 3)		
# # end
# # SubjectCombinationDetail.create(standard_id: 1, subject_id: 1, subject_combination_id: 2)
# # SubjectCombinationDetail.create(standard_id: 1, subject_id: 2, subject_combination_id: 2)
# # SubjectCombinationDetail.create(standard_id: 1, subject_id: 5, subject_combination_id: 2)
# # SubjectCombinationDetail.create(standard_id: 1, subject_id: 3, subject_combination_id: 1)
# # SubjectCombinationDetail.create(standard_id: 1, subject_id: 4, subject_combination_id: 1)
# # SubjectCombinationDetail.create(standard_id: 2, subject_id: 6, subject_combination_id: 4)
# # SubjectCombinationDetail.create(standard_id: 2, subject_id: 7, subject_combination_id: 4)
# # SubjectCombinationDetail.create(standard_id: 2, subject_id: 10, subject_combination_id: 4)
# # SubjectCombinationDetail.create(standard_id: 2, subject_id: 8, subject_combination_id: 3)
# # SubjectCombinationDetail.create(standard_id: 2, subject_id: 9, subject_combination_id: 3)
# # SubjectCombinationDetail.create(standard_id: 3, subject_id: 11, subject_combination_id: 6)
# # SubjectCombinationDetail.create(standard_id: 3, subject_id: 12, subject_combination_id: 6)
# # SubjectCombinationDetail.create(standard_id: 3, subject_id: 15, subject_combination_id: 6)
# # SubjectCombinationDetail.create(standard_id: 3, subject_id: 13, subject_combination_id: 5)
# # SubjectCombinationDetail.create(standard_id: 3, subject_id: 14, subject_combination_id: 5)

# # (1..3).each do |p|
# # 	(1..30).each do |q|
# # 		(1..5).each do |r|
# # 			if Student.find(q).subject_combination.subjects.include?(Subject.find(r))
# # 				mark = Mark.new(exam_id: p, student_id: q, subject_id: r, th_mark: rand(40..99))
# # 				mark.save
# # 			end
# # 		end
# # 	end
# # end
# # (1..3).each do |p|
# # 	Mark.where(exam_id: p).each do |mark|
# # 		mark.update_attributes(standard_id: mark.student.standard_id)
# # 	end 
# # end