class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.text :instructions
      t.text :card_text
      t.integer :act
      t.text :alert_text
      t.string :type

      t.timestamps
    end
  end
end
