class CreateChallenges < ActiveRecord::Migration[5.0]
  def change
    create_table :challenges do |t|
      t.string :name
      t.integer :score
      t.text :description

      t.timestamps
    end
  end
end
