require 'rails_helper'

describe " Google Search Weekly" do

    it "creates new GoogleSearchWeekly instances from a hash" do
      row_hash =
        {"Week"=>"2017-02-26", "news: (United States)"=>"76", "backpack: (United States)"=>"2", "commuter: (United States)"=>"1", "bus: (United States)"=>"12", "laptop: (United States)"=>"5"}

      week_stats = GoogleSearchWeekly.new(row_hash)
      expect(week_stats.standard).to eq(76)
      expect(week_stats.word_1).to eq(2)
      expect(week_stats.word_2).to eq(1)
      expect(week_stats.word_3).to eq(12)
      expect(week_stats.word_4).to eq(5)

    end

end
