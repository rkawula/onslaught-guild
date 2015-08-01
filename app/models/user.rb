class User < ActiveRecord::Base

  def self.find_or_create(auth)
    @user = where(provider: auth['provider'], uid: auth['uid'].to_s).first
    unless @user
      User.create! do
        @user.provider = auth['provider']
        @user. id = auth['uid'].to_s
      end
    end
    return @user
  end

end