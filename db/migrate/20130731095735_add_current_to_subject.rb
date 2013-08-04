class AddCurrentToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :current, :boolean
  end
end
