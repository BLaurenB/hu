require 'rails_helper'

describe "As an authenticated User" do
  scenario "I can create a new Venture" do
  user = User.create
  Authentication.create(provider: "google_oauth2", uid: "113329265138704766048", name: "BLauren Billington", oauth_token: "ya29.GltrBXQ6pO6hlwBXiQ8VMR4RCy7gqJ4MWfF1xmzMjrD5o...", oauth_expires_at: "2018-02-23 06:29:02", user_id: User.last.id)
  
  category = Category.create(title: "4451: Grocery Stores", code: 4451)

  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

  visit '/dashboard'
  click_on "New Venture"

  expect(current_path).to eq(new_venture_path)
  expect(page).to have_content("New Venture")

  fill_in "venture[title]", with: "Crazy Idea"
  fill_in "venture[description]", with: "Description"
  select "4451: Grocery Stores", from: "category"
  click_on "Next"

  expect(currrent_path).to eq(new_term_path)
  expect(Venture.last.title).to eq("Crazy Idea")

  expect(page).to have_content("Select Search Terms")
  fill_in "term[]", with: "cat"
  fill_in "term[]", with: "dog"
  fill_in "term[]", with: "kite"
  fill_in "term[]", with: "bone"
  click_on "Submit" #pass in  params and have a method that iterates through to create new Term objects. Terms need to be their own thing so that you can save different versions of the same Venture.

  expect(current_path).to eq(ventures_path)
  #From here, they can click a button to generate the report -- it's a button that generates the Venture show page...but first sends them an email.

  end

end
