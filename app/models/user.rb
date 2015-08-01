class User < ActiveRecord::Base

  def self.find_or_create(auth)
    @user = find_by(provider: auth['provider'], uid: auth['uid']).first
    unless @user
      @user = User.create! provider: auth['provider'],
                           name: auth['info']['name'],
                           uid: auth['uid'].to_s
    end
    return @user
  end

end