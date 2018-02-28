require 'rails_helper'

describe "HuInsights PORO" do

  it "instantiates 2 classes when initialized" do
    shop_array = [
      {},
      {"Week"=>"2017-02-26", "news: (United States)"=>"12", "backpack: (United States)"=>"1", "commuter: (United States)"=>"2", "jeans: (United States)"=>"12", "pocket: (United States)"=>"5"},
      {"Week"=>"2017-03-05", "news: (United States)"=>"14", "backpack: (United States)"=>"1", "commuter: (United States)"=>"2", "jeans: (United States)"=>"11", "pocket: (United States)"=>"5"},
      {"Week"=>"2017-03-12", "news: (United States)"=>"15", "backpack: (United States)"=>"1", "commuter: (United States)"=>"2", "jeans: (United States)"=>"12", "pocket: (United States)"=>"5"},
      {"Week"=>"2017-03-19", "news: (United States)"=>"16", "backpack: (United States)"=>"1", "commuter: (United States)"=>"2", "jeans: (United States)"=>"12", "pocket: (United States)"=>"5"},
      {"Week"=>"2017-03-26", "news: (United States)"=>"18", "backpack: (United States)"=>"1", "commuter: (United States)"=>"2", "jeans: (United States)"=>"13", "pocket: (United States)"=>"5"}
    ]
    search_array = [
      {},
      {"Week"=>"2017-02-26", "news: (United States)"=>"76", "backpack: (United States)"=>"2", "commuter: (United States)"=>"1", "bus: (United States)"=>"12", "laptop: (United States)"=>"5"},
      {"Week"=>"2017-03-05", "news: (United States)"=>"79", "backpack: (United States)"=>"2", "commuter: (United States)"=>"2", "bus: (United States)"=>"11", "laptop: (United States)"=>"6"},
      {"Week"=>"2017-03-12", "news: (United States)"=>"76", "backpack: (United States)"=>"4", "commuter: (United States)"=>"3", "bus: (United States)"=>"12", "laptop: (United States)"=>"7"},
      {"Week"=>"2017-03-19", "news: (United States)"=>"78", "backpack: (United States)"=>"2", "commuter: (United States)"=>"4", "bus: (United States)"=>"12", "laptop: (United States)"=>"5"},
      {"Week"=>"2017-03-26", "news: (United States)"=>"74", "backpack: (United States)"=>"5", "commuter: (United States)"=>"5", "bus: (United States)"=>"13", "laptop: (United States)"=>"9"}
    ]

    hu_insights = HuInsights.new(shop_array, search_array)

    expect(hu_insights.google_shop).to be_an_instance_of(GoogleShopAll)
    expect(hu_insights.google_search).to be_an_instance_of(GoogleSearchAll)



  end


end
