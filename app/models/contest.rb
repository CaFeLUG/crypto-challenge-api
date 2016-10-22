class Contest < ApplicationRecord
  has_and_belongs_to_many :challenges, join_table: "challenges_contests"

  before_create :set_initial_status

  #changes contest state from running to closed.
  #runs every minute from cron via whenever
  def self.check_closing_time
    self.where(status: 'running').each do |contest|
      if Time.now >= contest.ends_at
        contest.close!
      end
    end
  end

  def close!
    contest_status.trigger(:close)
  end

  def run!
    contest_status.trigger(:run)
  end

  def contest_status
    @contest_status ||= begin
      machine = MicroMachine.new(status || "pending")
      machine.when(:run, "pending" => "running")
      machine.when(:close, "running" => "closed")

      machine.on(:any) { self.status = machine.state }

      machine
    end
  end

  private

  def set_initial_status
    self.status = contest_status.state
  end
end
