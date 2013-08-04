class CreateSubjectCombinationDetails < ActiveRecord::Migration
  def change
    create_table :subject_combination_details do |t|
      t.integer :standard_id
      t.integer :subject_combination_id
      t.integer :subject_id

      t.timestamps
    end
  end
end
