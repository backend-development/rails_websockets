class User < ApplicationRecord
  has_many :steps, dependent: :destroy
  has_many :stepstones, through: :steps
  has_many :adventures, -> { distinct }, through: :stepstones

  def self.gravatar_url(email)
    gravatar_id = Digest::MD5.hexdigest(email.downcase)
    "https://gravatar.com/avatar/#{gravatar_id}.jpg?s=48&d=identicon"
  end

  def self.find_or_create_with_omniauth(auth_hash)
    # identify user by provider + uid
    user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
    user.token = auth_hash['credentials']['token']

    # additional info about the user
    if auth_hash['info']
      user.email = auth_hash['info']['email']
      user.full_name = auth_hash['info']['name']
      user.image = auth_hash['info']['image'] || gravatar_url(user.email)
    end
    user.save!
    user
  end

  def to_s
    full_name || "#{uid}@#{provider}"
  end
end
