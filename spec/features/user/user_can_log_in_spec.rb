require 'rails_helper'

describe "As a User when I visit the root" do
  #stub omniauth!
  it "I see a link to log in with Google" do

    visit '/'

    expect(page).to have_content("Hu")
    expect(page).to have_content("Who is Hu?")
    click_on "Log in with Google"

    expect(current_path).to eq("/#{User.last.username}")

  end

end

describe "As an authenticated user, when I log in" do
  it "I see my dashboard" do
    #create Ventures and other objects to populate the page! user.venture

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit '/dashboard'
    expect(page).to have_content("Hi, #{user.username}!")
    expect(page).to have_content("Ventures")
    expect(page).to have_content(venture_1.name)

  end
end

#
# require 'rails_helper'
#
# feature "Unauthenticated user can login with Github" do
#   before do
#     stub_omniauth
#   end
#
#   scenario  "using a valid GitHub account" do
#     VCR.use_cassette("user_views_overview_page") do
#       visit '/'
#       click_on "Login with Github!"
#       expect(current_path).to eq("/#{User.last.username}")
#     end
#   end
#
#     it "they can see their overview page" do
#       VCR.use_cassette("user_views_overview_page") do
#
#         visit '/'
#         click_on "Login with Github!"
#         expect(page).to_not have_content("Login with Github!")
#         expect(page).to have_content("Repositories:28")   #this can be brittle when the info changes.
#         expect(page).to have_content("Following:1")
#
#       end
#     end
#
# end
