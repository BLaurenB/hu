require 'rails_helper'


describe "User can manage all their ventures" do

  it "they visit the venture index" do
    Category.create(code: 45322, title: "Gift, novelty, and souvenir stores")

    user =    User.create
    auth =    Authentication.create(provider: "google", uid: "googleid", name: "test_uesr_name", oauth_token: "12345", oauth_expires_at: nil, user_id: user.id)

    venture_1 =   Venture.create(title: "Lollipop Stand", description: "sell lollipops", notes: "notes!", user_id: user.id, category_id: Category.last.id)
    snapshot_1 =  Snapshot.create(venture_id: venture_1.id, file: nil)
    term_1 =      Term.create(venture_id: venture_1.id, snapshot_id: snapshot_1.id, words: ["candy", "artisanal lollipop", "organic lollipop", "sugar"])

    venture_2 =   Venture.create(title: "Banana Stand", description: "sell lollipops", notes: "notes!", user_id: user.id, category_id: Category.last.id)
    snapshot_2 =  Snapshot.create(venture_id: venture_2.id, file: nil)
    term_2 =      Term.create(venture_id: venture_2.id, snapshot_id: snapshot_2.id, words: ["candy", "artisanal lollipop", "organic lollipop", "sugar"])
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit "/ventures"

    expect(page).to have_content("Lollipop Stand")
    expect(page).to have_content("Banana Stand")

  end
  it "they edit a venture" do
    Category.create(code: 45322, title: "Gift, novelty, and souvenir stores")

    user =    User.create
    auth =    Authentication.create(provider: "google", uid: "googleid", name: "test_uesr_name", oauth_token: "12345", oauth_expires_at: nil, user_id: user.id)

    venture_1 =   Venture.create(title: "Lollipop Stand", description: "sell lollipops", notes: "notes!", user_id: user.id, category_id: Category.last.id)
    snapshot_1 =  Snapshot.create(venture_id: venture_1.id, file: nil)
    term_1 =      Term.create(venture_id: venture_1.id, snapshot_id: snapshot_1.id, words: ["candy", "artisanal lollipop", "organic lollipop", "sugar"])

    venture_2 =   Venture.create(title: "Banana Stand", description: "sell lollipops", notes: "notes!", user_id: user.id, category_id: Category.last.id)
    snapshot_2 =  Snapshot.create(venture_id: venture_2.id, file: nil)
    term_2 =      Term.create(venture_id: venture_2.id, snapshot_id: snapshot_2.id, words: ["candy", "artisanal lollipop", "organic lollipop", "sugar"])
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/ventures/#{venture_1.id}/edit"

        fill_in "venture[title]", with: "Crazy Idea"
        fill_in "venture[description]", with: "Description"
        fill_in "venture[notes]", with: "Looooooooooooooooooooooooooooooooong list of notes"
        # save_and_open_page
        click_on "Update Venture"

        expect(current_path).to eq(venture_path(venture_1))
        expect(venture_1.title).to eq("Crazy Idea")
        expect(venture_1.description).to eq("Description")


  end


end
