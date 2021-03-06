class CreateCollabs < ActiveRecord::Migration[5.1]
  def change
    create_table :collabs do |t|
      t.string :firstname
      t.string :lastname
      t.string :address
      t.string :gender
      t.date :birth_date
      t.string :social_security_number
      t.string :birth_city
      t.references :fr_nationality, foreign_key: true
      t.references :firm, foreign_key: true
      t.references :function, foreign_key: true

      t.timestamps
    end
  end
end
