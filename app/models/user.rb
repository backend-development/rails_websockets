class User < ApplicationRecord
  def self.find_or_create_with_omniauth(auth_hash)
    # identify user by provider + uid
    Rails.logger.warn(auth_hash)
    user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])

    user.token     = auth_hash['credentials']['token']
    user.token_expires_at = DateTime.strptime(auth_hash['credentials']['expires_at'].to_s, '%s')

    # additional info about the user
    if auth_hash['info']
      user.email       = auth_hash['info']['email']
      user.full_name   = auth_hash['info']['name']
      user.first_name  = auth_hash['info']['first_name']
      user.last_name   = auth_hash['info']['last_name']
    end
    user.save!
    user
  end
end
