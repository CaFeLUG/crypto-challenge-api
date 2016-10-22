class Challenge < ApplicationRecord
  has_and_belongs_to_many :contests, join_table: "challenges_contests"
end
