class Adventure < ActiveRecord::Base
  belongs_to :user
  has_many :stepstones, :order => "position"
  has_many :steps, :through => :stepstones
  attr_accessible :title, :description, :user_id

  validates_presence_of :title, :user_id
  validates :title, :length => { :minimum => 5 }

  scope :current

  def belongs_to?( u )
    self.user.id == u.id
  end
end
