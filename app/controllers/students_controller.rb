class StudentsController < ApplicationController
  def index
    @students = Student.where(current: true, standard_id: params[:standard_id])
    @standards = Standard.where(current: true)
    if !params[:standard_id]
      redirect_to standard_students_path(@standards[0].id)
    end
  end

  def new
    @student = Student.new()
    @standards = Standard.where(current: true) 
    @subject_combinations = SubjectCombination.where(standard_id: params[:standard_id])
    if !params[:standard_id]
      redirect_to new_standard_student_path(@standards[0].id)
    end
  end

  def create
    @student = Student.new(params[:student])
    @standards = Standard.where(current: true)
    if @student.save
      if params[:commit] == "Create"
        redirect_to standard_students_path(params[:student][:standard_id])
      else
        redirect_to new_standard_student_path(params[:student][:standard_id])
      end
    else
     render 'new'
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
  end

  def update
  end

  def edit_multiple 
    student_ids = params[:student_ids]
    @students = Student.find(student_ids)
    @standards = Standard.where(current: true)
    @subject_combinations = SubjectCombination.where(standard_id: params[:standard_id])
  end

  def update_multiple
    student_ids = params[:student_ids]
    @students = Student.find(student_ids)
    @standards = Standard.where(current: true)
    @subject_combinations = SubjectCombination.where(standard_id: params[:student][:standard_id])
    @students.each do |student|
      student.update_attributes(params[:student].reject {|k,v| v.blank?})
      if (params[:student][:standard_id].blank?)
        student.update_attributes(standard_id: nil, current: false)
      end
    end
    redirect_to standard_students_path(params[:student][:standard_id])
  end
  def update_subject_combination
    if params[:student_standard_id].to_i != 0 ## when subject id is not blank 
      @standard = Standard.find(params[:student_standard_id].to_i)  
      @subject_combinations = @standard.subject_combinations
      if @subject_combinations.count == 0 
        @subject_combinations = ["No Combinations Available"]
      else
        @subject_combinations = @subject_combinations.map{|combination| [combination.name, combination.id]}
      end
    else  ## when subject combination count is 
      @subject_combinations = ["No Combinations Available"]
    end
  end
end
