class User < ActiveRecord::Base

  validates :permission_level, inclusion: { in: 0..4 } 

  def self.find_or_create(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.battletag
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.permission_level = 4
      user.save!
    end
  end

end