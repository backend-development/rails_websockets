class Step < ApplicationRecord
  include AASM

  belongs_to :user
  belongs_to :stepstone

  aasm do
    state :not_started, inital: true
    state :blocked, :working, :finished
  end

  def to_s
    user.full_name
  end

  def self.statuses
    Step.aasm.states.map(&:name)
  end

  def status
    aasm_state
  end
end
