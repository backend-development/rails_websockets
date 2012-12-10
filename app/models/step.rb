class Step < ActiveRecord::Base
  belongs_to :user
  belongs_to :stepstone

  validates :user_id, :uniqueness => {:scope => :stepstone_id}

  attr_accessible :stepstone_id, :user_id

  state_machine initial: :started do
    event :finish! do
      transition :started => :done
    end

    event :skip! do
      transition :started => :skipped
    end

    event :restart! do
      transition :skipped => :started
    end

    event :confirm! do
      transition :done => :confirmed
    end

    state :started,   :value => "started"
    state :skipped,   :value => "skipped"
    state :done,      :value => "done"
    state :confirmed, :value => "confirmed"
  end

  state_machine.states.map do |state|
    scope state.name, :conditions => { :state => state.name.to_s }
  end

  def self.states
    state_machine.states.map { |s| s.name.to_s }
  end

  def self.transitions
    state_machine.events.map { |e| e.name.to_s }
  end

  def user_action?
    ['started', 'skipped'].include? self.state
  end
  
  def owner_action?
    [:done].include? self.state
  end
end
