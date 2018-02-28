require 'rails_helper'

describe " Google Shop All" do

    it "creates new GoogleShopWeekly instances from a hash" do
      csv_hash = [
        {},
        {"Week"=>"2017-02-26", "news: (United States)"=>"76", "backpack: (United States)"=>"2", "commuter: (United States)"=>"1", "bus: (United States)"=>"12", "laptop: (United States)"=>"5"},
        {"Week"=>"2017-03-05", "news: (United States)"=>"79", "backpack: (United States)"=>"2", "commuter: (United States)"=>"2", "bus: (United States)"=>"11", "laptop: (United States)"=>"6"},
        {"Week"=>"2017-03-12", "news: (United States)"=>"76", "backpack: (United States)"=>"4", "commuter: (United States)"=>"3", "bus: (United States)"=>"12", "laptop: (United States)"=>"7"},
        {"Week"=>"2017-03-19", "news: (United States)"=>"78", "backpack: (United States)"=>"2", "commuter: (United States)"=>"4", "bus: (United States)"=>"12", "laptop: (United States)"=>"5"},
        {"Week"=>"2017-03-26", "news: (United States)"=>"74", "backpack: (United States)"=>"5", "commuter: (United States)"=>"5", "bus: (United States)"=>"13", "laptop: (United States)"=>"9"}
      ]
      google_shop = GoogleShopAll.new(csv_hash)
      expect(google_shop.all_stats.count).to eq(6)
    end

    it "calculates the average per week" do
      csv_hash = [
        {},
        {"Week"=>"2017-02-26", "news: (United States)"=>"76", "backpack: (United States)"=>"2", "commuter: (United States)"=>"1", "bus: (United States)"=>"12", "laptop: (United States)"=>"5"},
        {"Week"=>"2017-03-05", "news: (United States)"=>"79", "backpack: (United States)"=>"2", "commuter: (United States)"=>"2", "bus: (United States)"=>"11", "laptop: (United States)"=>"6"},
        {"Week"=>"2017-03-12", "news: (United States)"=>"76", "backpack: (United States)"=>"4", "commuter: (United States)"=>"3", "bus: (United States)"=>"12", "laptop: (United States)"=>"7"},
        {"Week"=>"2017-03-19", "news: (United States)"=>"78", "backpack: (United States)"=>"2", "commuter: (United States)"=>"4", "bus: (United States)"=>"12", "laptop: (United States)"=>"5"},
        {"Week"=>"2017-03-26", "news: (United States)"=>"74", "backpack: (United States)"=>"5", "commuter: (United States)"=>"5", "bus: (United States)"=>"13", "laptop: (United States)"=>"9"}
      ]
      google_shop = GoogleShopAll.new(csv_hash)
      expect(google_shop.standard_average.to_i). to eq(7)
      expect(google_shop.word_1_average.to_i). to eq(0)
      expect(google_shop.word_2_average.to_i). to eq(0)
      expect(google_shop.word_3_average.to_i). to eq(1)
      expect(google_shop.word_4_average.to_i). to eq(0)

    end


    it "calculates the word score against the standard" do
      csv_hash = [
        {},
        {"Week"=>"2017-02-26", "news: (United States)"=>"76", "backpack: (United States)"=>"2", "commuter: (United States)"=>"1", "bus: (United States)"=>"12", "laptop: (United States)"=>"5"},
        {"Week"=>"2017-03-05", "news: (United States)"=>"79", "backpack: (United States)"=>"2", "commuter: (United States)"=>"2", "bus: (United States)"=>"11", "laptop: (United States)"=>"6"},
        {"Week"=>"2017-03-12", "news: (United States)"=>"76", "backpack: (United States)"=>"4", "commuter: (United States)"=>"3", "bus: (United States)"=>"12", "laptop: (United States)"=>"7"},
        {"Week"=>"2017-03-19", "news: (United States)"=>"78", "backpack: (United States)"=>"2", "commuter: (United States)"=>"4", "bus: (United States)"=>"12", "laptop: (United States)"=>"5"},
        {"Week"=>"2017-03-26", "news: (United States)"=>"74", "backpack: (United States)"=>"5", "commuter: (United States)"=>"5", "bus: (United States)"=>"13", "laptop: (United States)"=>"9"}
      ]
      google_shop = GoogleShopAll.new(csv_hash)

      expect(google_shop.word_1_insight).to eq(3)
      expect(google_shop.word_2_insight).to eq(3)
      expect(google_shop.word_3_insight).to eq(15)
      expect(google_shop.word_4_insight).to eq(8)

    end

end
