class User < ApplicationRecord
  has_many :steps, dependent: :destroy
  has_many :stepstones, through: :steps
  has_many :adventures, -> { distinct }, through: :stepstones

  def self.find_or_create_with_omniauth(auth_hash)
    # identify user by provider + uid
    user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
    user.token = auth_hash['credentials']['token']

    # additional info about the user
    if auth_hash['info']
      user.email       = auth_hash['info']['email']
      user.full_name   = auth_hash['info']['full_name']
      user.first_name  = auth_hash['info']['first_name']
      user.last_name   = auth_hash['info']['last_name']
    end
    user.save!
    user
  end

  def to_s
    full_name || "#{uid}@#{provider}"
  end
end
