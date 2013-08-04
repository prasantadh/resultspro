class AddDefaultValueToSubjectPractical < ActiveRecord::Migration
  def up
  	change_column :subjects, :practical, :boolean, :default => false
  end
  def down
  	change_column :subjects, :practical, :boolean, :default => nil
  end
end
