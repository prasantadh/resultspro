class ChangeColumnName < ActiveRecord::Migration
  def up
  	rename_column :marks, :mark, :th_mark
  end

  def down
  	rename_column :marks, :th_mark, :mark
  end
end
