class CreateCollectiveAgreements < ActiveRecord::Migration[5.1]
  def change
    create_table :collective_agreements do |t|
      t.string :idcc
      t.string :title

      t.timestamps
    end
  end
end
