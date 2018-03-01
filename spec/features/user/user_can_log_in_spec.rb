require 'rails_helper'

describe "As a User when I visit the root" do
  #stub omniauth!
  it "I see a link to log in with Google" do
    stub_omniauth

    visit '/'

    expect(page).to have_content("Hu")
    expect(page).to have_content("Who is Hu?")
    click_on "Sign in with Google"
    expect(current_path).to eq("/dashboard")

  end

end

describe "As an authenticated user, when I log in" do
  it "I see my dashboard" do
    #create Ventures and other objects to populate the page! user.venture
    user = User.create
    Authentication.create(provider: "google_oauth2", uid: "113329265138704766048", name: "BLauren Billington", oauth_token: "ya29.GltrBXQ6pO6hlwBXiQ8VMR4RCy7gqJ4MWfF1xmzMjrD5o...", oauth_expires_at: "2018-02-23 06:29:02", user_id: User.last.id)

    venture = create_list(:venture, 3, user: user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/dashboard'
    expect(page).to have_content("Hi, #{user.authentication.name}!")
    expect(page).to have_content("Hi, BLauren Billington")
    expect(page).to have_content(venture[0].title)
    expect(page).to have_content(venture[2].title)

    click_on 'Sign out'
    expect(current_path).to eq('/')

  end
end
