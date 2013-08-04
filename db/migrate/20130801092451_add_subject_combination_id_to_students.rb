class AddSubjectCombinationIdToStudents < ActiveRecord::Migration
  def change
    add_column :students, :subject_combination_id, :integer
  end
end
