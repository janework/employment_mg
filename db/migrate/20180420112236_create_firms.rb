class CreateFirms < ActiveRecord::Migration[5.1]
  def change
    create_table :firms do |t|
      t.string :name
      t.string :address
      t.string :siret
      t.string :rcs
      t.string :legal_form
      t.string :urssaf
      t.string :urssaf_place
      t.references :collective_agreement, foreign_key: true
      t.integer :representative_id

      t.timestamps
    end
  end
end
