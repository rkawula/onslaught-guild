class User < ActiveRecord::Base

  def self.find_or_create(auth)
    @user = User.where(:provider => auth['provider'], :uid => auth['uid'].to_s)
    unless @user
      User.create! do
        @user.provider = auth['provider']
        @user.uid = auth['uid'].to_s
      end
    end
    return @user
  end

end