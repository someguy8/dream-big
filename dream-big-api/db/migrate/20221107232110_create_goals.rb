class CreateGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :goals do |t|
      t.string :description
      t.string :status
      t.bigint :section_id
      t.timestamps
    end
  end
end
