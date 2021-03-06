class SubjectsController < ApplicationController
  def index
    @standards = Standard.where(current: true)
    @subjects = Subject.where(current: true, standard_id: params[:standard_id])
    if !params[:standard_id]
      redirect_to standard_subjects_path(@standards[0].id)
    end
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new()
    @standards = Standard.where(current: true)
    if !params[:standard_id]
      redirect_to new_standard_subject_path(@standards[0].id)
    end
  end

  def create
    @subject = Subject.new(params[:subject])
    @subject.save
    if params[:commit] == "Create"
      redirect_to standard_subjects_path(params[:subject][:standard_id])
    else
      redirect_to new_standard_subject_path(params[:subject][:standard_id])
    end
  end

  def edit
    @standards = Standard.where(current: true)
    @subject = Subject.find(params[:id].to_i)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @subject = Subject.find(params[:id])
    @subject.update_attributes(current: false)
    redirect_to standard_subjects_path(params[:standard_id].to_i)
  end


  def update_subjects
    # updates artists and songs based on genre selected
    @standard = Standard.find(params[:standard_id])
    # map to name and id for use in our options_for_select
    @subjects = @standard.subjects.map{|a| [a.name, a.id]}.insert(0, "Select a subject.")
    respond_to do |format|
      # format.html
      format.js
    end
  end
end
