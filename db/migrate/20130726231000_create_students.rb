class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :roll
      t.string :name
      t.integer :standard_id

      t.timestamps
    end
  end
end
