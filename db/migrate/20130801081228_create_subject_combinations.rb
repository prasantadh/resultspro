class CreateSubjectCombinations < ActiveRecord::Migration
  def change
    create_table :subject_combinations do |t|
      t.string :name
      t.integer :standard_id

      t.timestamps
    end
  end
end
