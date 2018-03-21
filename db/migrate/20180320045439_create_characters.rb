class CreateCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :characters do |t|
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.string :gender
      t.integer :risk_matrix_id
      t.integer :decision_id
      t.integer :player_id

      t.timestamps
    end
  end
end
