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
  	@standards = Standard.where(current: true) ## customize this to get only the current standards
  	@standard_ids = @standards.map{|s| s.id}
  	@students  = Student.where("standard_id IN (?)", @standard_ids, current: true)
  	@subjects = Subject.where(current: true)
  	@subject_ids = @subjects.map{|s| s.id}
  	@students.each do |student|
  		@subjects.each do |subject|
        if student.standard.subject_combinations != []
          if student.subject_combination.subjects.include?(Subject.find(subject.id))
  			   Mark.create(exam_id: @exam.id, standard_id: student.standard.id, student_id: student.id, subject_id: subject.id)  	
          end
        else
          Mark.create(exam_id: @exam.id, standard_id: student.standard.id, student_id: student.id, subject_id: subject.id) 
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
