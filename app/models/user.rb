class User < ActiveRecord::Base

  def self.find_or_create(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.save!
    end
  end

end