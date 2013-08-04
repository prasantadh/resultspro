class SubjectCombinationsController < ApplicationController
  def index
    @standards = Standard.where(current: true)
    if !params[:standard_id]
      redirect_to standard_subject_combinations_path(@standards[0])
    end
    @subject_combinations = SubjectCombination.where(standard_id: params[:standard_id])
  end

  def show
  end

  def new
    @standards = Standard.where(current: true)
    if !params[:standard_id]
      redirect_to new_standard_subject_combination_path(@standards[0].id)
    end
    @subject_combination = SubjectCombination.new
    @subjects = Subject.where(standard_id: params[:standard_id], current: true)
  end

  def create
    @subject_combination = SubjectCombination.create(name: params[:subject_combination][:name], standard_id: params[:standard_id])
    if params[:subject]
      params[:subject].each do |subject_id, value|
        subject = Subject.find(subject_id)
        SubjectCombinationDetail.create(standard_id: params[:standard_id], subject_id: subject.id, subject_combination_id: @subject_combination.id)
      end
    end
    redirect_to standard_subject_combinations_path(params[:standard_id].to_i)
  end

  def edit
  end

  def update
  end

  def destroy
    @subject_combination = SubjectCombination.find(params[:id])
    @subject_combination.destroy
    redirect_to standard_subject_combinations_path(params[:standard_id].to_i)
  end
end
