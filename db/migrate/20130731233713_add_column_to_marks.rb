class AddColumnToMarks < ActiveRecord::Migration
  def change
    add_column :marks, :pr_mark, :integer
  end
end
