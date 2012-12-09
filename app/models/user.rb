class User < ActiveRecord::Base

  has_many :adventures  # user can own an adventure
  has_many :steps       # when user takes part in adventure, each
                        # step is recorded seperately


  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :nickname

  validates :nickname, :length => { :minimum => 5 }

end
