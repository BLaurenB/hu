FactoryBot.define do
  factory :authentication do
    provider "google"
    uid "MyString"
    name "MyName"
    oauth_token "MyString"
    oauth_expires_at "2018-02-22 16:13:20"
    user
  end
end
