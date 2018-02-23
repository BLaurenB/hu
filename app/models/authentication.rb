class Authentication < ApplicationRecord
  belongs_to :user
  # validates :username, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |a|
      a.provider = auth.provider
      a.uid = auth.uid
      a.name = auth.info.name
      a.oauth_token = auth.credentials.token
      a.oauth_expires_at = Time.at(auth.credentials.expires_at)
      a.user_id = User.create.id if a.user_id == nil
      a.save!
    end
  end

end
