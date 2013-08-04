class AddStandardIdToMarks < ActiveRecord::Migration
  def change
    add_column :marks, :standard_id, :integer
  end
end
