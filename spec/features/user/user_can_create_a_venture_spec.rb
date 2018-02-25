require 'rails_helper'

describe "As an authenticated User" do
  describe "I can create a new Venture" do

    it "and add search terms" do
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
    select "4451: Grocery Stores", from: "venture[category_id]"
    fill_in "venture[notes]", with: "Looooooooooooooooooooooooooooooooong list of notes"
    click_on "Next"

    expect(current_path).to eq(new_term_path)
    expect(Venture.last.title).to eq("Crazy Idea")
    expect(page).to have_content(Venture.last.notes)

    expect(page).to have_content("Create Search terms for")
    fill_in "word_1", with: "cat"
    fill_in "word_2", with: "dog"
    fill_in "word_3", with: "kite"
    fill_in "word_4", with: "bone"
    click_on "Get Report" #pass in  params and have a method that iterates through to create new Term objects. Terms need to be their own thing so that you can save different versions of the same Venture.

    expect(current_path).to eq(ventures_path)
    #From here, they can click a button to generate the report -- it's a button that generates the Venture show page...but first sends them an email.

    end

    xit "without search terms" do
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
      select "4451: Grocery Stores", from: "venture[category_id]"
      click_on "Next"

      expect(current_path).to eq(new_term_path)
      expect(Venture.last.title).to eq("Crazy Idea")
      click_link("Save and finish later")
      expect(current_path).to eq(ventures_path)
    end
  end

end
