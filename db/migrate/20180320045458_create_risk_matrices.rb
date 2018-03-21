class CreateRiskMatrices < ActiveRecord::Migration[5.1]
  def change
    create_table :risk_matrices do |t|
      t.integer :risk_score

      t.timestamps
    end
  end
end
