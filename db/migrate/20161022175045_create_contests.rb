class CreateContests < ActiveRecord::Migration[5.0]
  def change
    create_table :contests do |t|
      t.string :name
      t.timestamp :begins_at
      t.timestamp :ends_at
      t.string :status
      t.text :rules

      t.timestamps
    end
  end
end
