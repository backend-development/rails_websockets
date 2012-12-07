class Adventure < ActiveRecord::Base
  has_many :steps
  attr_accessible :title, :description

  validates :title, :length => { :minimum => 5 }

  scope :current
end
