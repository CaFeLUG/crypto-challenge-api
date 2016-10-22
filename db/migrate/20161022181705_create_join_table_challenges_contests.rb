class CreateJoinTableChallengesContests < ActiveRecord::Migration[5.0]
  def change
    create_join_table :challenges, :contests do |t|
      t.index [:challenge_id, :contest_id]
      t.index [:contest_id, :challenge_id]
    end
  end
end
