class Contest < ApplicationRecord
  has_and_belongs_to_many :challenges, join_table: "challenges_contests"

  before_save :persist_status

  #changes contest state from running to closed.
  #runs every minute from cron via whenever
  def self.check_closing_time
    self.where(status: 'running').each do |contest|
      if Time.now >= contest.ends_at
        contest.update_attribute(:status, 'closed')
        puts contest.inspect
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
      fsm = MicroMachine.new(status || "pending")
      fsm.when(:run, "pending" => "running")
      fsm.when(:close, "running" => "closed")

      fsm
    end
  end


  protected

  def persist_status
    self.status = contest_status.state
  end
end
