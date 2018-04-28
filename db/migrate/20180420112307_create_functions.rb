class CreateFunctions < ActiveRecord::Migration[5.1]
  def change
    create_table :functions do |t|
      t.string :title
      t.string :level
      t.string :coefficient
      t.string :status
      t.integer :monthly_starting_salary
      t.integer :annual_starting_salary
      t.string :bonus

      t.timestamps
    end
  end
end
