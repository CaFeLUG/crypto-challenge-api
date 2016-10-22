class CreateHints < ActiveRecord::Migration[5.0]
  def change
    create_table :hints do |t|
      t.string :name
      t.references :challenge, foreign_key: true

      t.timestamps
    end
  end
end
