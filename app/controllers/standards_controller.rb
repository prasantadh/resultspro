class StandardsController < ApplicationController
  before_filter :set_start_time
  before_filter :variables
  def set_start_time
    @start_time = Time.now.usec
  end
  def edit_ledger
    ## all requirements met in variables
  end

  def new
    @standards = Standard.all
    @standard = Standard.new
  end

  def create
    @standard = Standard.new(params[:standard])
    @standard.save
    if params[:commit] == "Create" 
      redirect_to root_path
    else
      redirect_to new_standard_path
    end
  end

  def update_ledger
  	@students.each do |student|
  		@subjects.each do |subject|
  			@record = Mark.where("exam_id = ? AND student_id = ? AND subject_id = ?", @exam_id, student.id, subject.id)
        if @record[0]
    			@record[0].update_attributes(th_mark: params[:mark]["#{student.id}"]["#{subject.id}"]["0"], pr_mark: params[:mark]["#{student.id}"]["#{subject.id}"]["1"])
        end
  		end
  	end
    # render 'edit_ledger'
    redirect_to exam_standard_edit_ledger_path
  end

  def mark_sheets
    ## all requirements met in variables
  end

protected
  def variables
    @exam_id = params[:exam_id].to_i
    @standard_id = params[:standard_id].to_i
    @students = Array.new()
    @subjects = Array.new()
    @standards = Array.new()
    Mark.where("standard_id = ? AND exam_id = ? ", params[:standard_id], params[:exam_id]).each do |mark|
      @subjects << mark.subject if !@subjects.include?(mark.subject)
      @students << mark.student if !@students.include?(mark.student)
    end
    Mark.where("exam_id = ?", params[:exam_id]).each do |mark|
      @standards << mark.standard if !@standards.include?(mark.standard)
    end
    subject_ids = @subjects.map{|s| s.id } ##edit_ledger
    student_ids = @students.map{|s| s.id } ##edit_ledger
    @marks = Mark.where("exam_id = ? AND student_id IN (?) AND subject_ids IN (?)", @exam_id, student_ids, subject_ids) ##edit_ledger
  end 
end
