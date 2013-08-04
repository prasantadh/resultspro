class AddDefaultValueToCurrent < ActiveRecord::Migration
  def up
  	change_column :standards, :current, :boolean, :default => true
  	change_column :subjects , :current, :boolean, :default => true
  end

  def down
  	change_column :standards, :current, :boolean, :default => nil
  	change_column :subjects , :current, :boolean, :default => nil
  end


end
