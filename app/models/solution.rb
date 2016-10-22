class Solution < ApplicationRecord
  belongs_to :user
  belongs_to :contest
  belongs_to :challenge
end
