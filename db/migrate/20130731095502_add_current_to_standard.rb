class AddCurrentToStandard < ActiveRecord::Migration
  def change
    add_column :standards, :current, :boolean
  end
end
