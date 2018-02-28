require 'rails_helper'

describe "Authentication" do
  it "can be created with valid oath params" do
    user = User.create
    new_auth = Authentication.create(provider: "google_oauth2", uid: "123456789", name: "Lauren", oauth_token: "niftytokenhere", oauth_expires_at: "2018-02-23 06:29:02", user_id: user.id)

    expect(new_auth).to be_an_instance_of(Authentication)
  end

end
