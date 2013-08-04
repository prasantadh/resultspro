class AddColumnsToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :full_mark, :integer
    add_column :subjects, :pass_mark, :integer
    add_column :subjects, :practical, :boolean
    add_column :subjects, :practical_full_mark, :integer
    add_column :subjects, :practical_pass_mark, :integer
  end
end
