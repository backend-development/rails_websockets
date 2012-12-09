class Step < ActiveRecord::Base
  belongs_to :user
  belongs_to :stepstone

  attr_accessible :stepstone_id, :user_id

  state_machine initial: :started do
    event :finish do
      transition :started => :done
    end

    event :skip do
      transition :started => :skipped
    end

    event :restart do
      transition :skipped => :started
    end

    event :confirm do
      transition :done => :confirmed
    end
  end
end
