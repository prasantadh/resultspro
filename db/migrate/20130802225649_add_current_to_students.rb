class AddCurrentToStudents < ActiveRecord::Migration
  def change
    add_column :students, :current, :boolean, default: true
  end
end
