class ExamsController < ApplicationController
  def index

  end

  def new
  	@exam = Exam.new()
    @standards = Standard.where(current: true) 
  end

  def create
  	@exam = Exam.new(params[:exam])
  	@exam.save
  	@standards = Standard.where(current: true)
  	@standard_ids = @standards.map{|s| s.id}
  	@students  = Student.where("current = ? AND standard_id IN (?)", true, @standard_ids)
  	@subjects = Subject.where(current: true)
  	@subject_ids = @subjects.map{|s| s.id}
  	@students.each do |student|
  		@subjects.each do |subject|
        if student.standard.subject_combinations != []  ## if the standard has subject combinations
          if student.subject_combination.subjects.include?(Subject.find(subject.id))  ##for the subjects taken by student
  			   Mark.create(exam_id: @exam.id, standard_id: student.standard.id, student_id: student.id, subject_id: subject.id)   	
          end
        else  ## if the standard does not have subject combinations
          if student.standard.subjects.include? Subject.find(subject.id) ## if the subject belongs to the student's standard
            Mark.create(exam_id: @exam.id, standard_id: student.standard.id, student_id: student.id, subject_id: subject.id) 
          end
        end	
  		end
  	end
  	redirect_to exam_path(@exam)
  end

  def show
  	@standards = Array.new()
  	Mark.where("exam_id = ?", params[:id]).each do |mark|
  		@standards << mark.standard if !@standards.include?(mark.standard)
  	end
  	# to directly redirect to the ledger of an exam
  	redirect_to exam_standard_edit_ledger_path(params[:id], @standards[0].id)
  end

end
