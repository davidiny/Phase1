class CreateDecisions < ActiveRecord::Migration[5.1]
  def change
    create_table :decisions do |t|
      t.string :decision_string

      t.timestamps
    end
  end
end
