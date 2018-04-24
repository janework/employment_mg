class CreateContracts < ActiveRecord::Migration[5.1]
  def change
    create_table :contracts do |t|
      t.date :hiring_date
      t.string :mobility_zone

      t.string :nature
      t.string :task
      t.float :week_work_duration
      t.integer :paid_vacation_days
      t.integer :initial_trial_period_duration
      t.boolean :renewal_trial_period, null: false, default: true
      t.string :initial_trial_period_type
      t.references :firm, foreign_key: true
      t.references :collab, foreign_key: true

      t.timestamps
    end
  end
end
