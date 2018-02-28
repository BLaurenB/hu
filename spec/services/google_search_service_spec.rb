require 'rails_helper'

describe "Google Search Service" do
  it "creates a new url based on Terms array" do
    venture = create(:venture)
    snapshot = create(:snapshot, venture: venture)

    terms = Term.create(venture: venture, snapshot: snapshot, words: ["jeans", "womens jeans", "big pockets", "womens jeans big pocket"])
    parsed_link_string = GoogleSearchService.new(terms.words).terms_for_link
    link_string = "jeans,womens%20jeans,big%20pockets,womens%20jeans%20big%20pocket"

    expect(parsed_link_string).to eq(link_string)

  end


it "takes a CSV and returns a hash" do
  # allow_any_instance_of(GoogleSearchService).to receive(:csv_file).and_return(csv_file)
  terms = ["jeans", "womens jeans", "big pockets", "womens jeans big pocket"]
  csv_file = "./db/multiTimeline.csv"
  parsed_hash = GoogleSearchService.new(terms).parse_csv
  stubbed_hash = [
    {},
    {"Week"=>"2017-02-26", "news: (United States)"=>"76", "backpack: (United States)"=>"2", "commuter: (United States)"=>"1", "bus: (United States)"=>"12", "laptop: (United States)"=>"5"},
    {"Week"=>"2017-03-05", "news: (United States)"=>"79", "backpack: (United States)"=>"2", "commuter: (United States)"=>"2", "bus: (United States)"=>"11", "laptop: (United States)"=>"6"},
    {"Week"=>"2017-03-12", "news: (United States)"=>"76", "backpack: (United States)"=>"4", "commuter: (United States)"=>"3", "bus: (United States)"=>"12", "laptop: (United States)"=>"7"},
    {"Week"=>"2017-03-19", "news: (United States)"=>"78", "backpack: (United States)"=>"2", "commuter: (United States)"=>"4", "bus: (United States)"=>"12", "laptop: (United States)"=>"5"},
    {"Week"=>"2017-03-26", "news: (United States)"=>"74", "backpack: (United States)"=>"5", "commuter: (United States)"=>"5", "bus: (United States)"=>"13", "laptop: (United States)"=>"9"}
  ]

    expect(parsed_hash).to eq(stubbed_hash)
  end

end
