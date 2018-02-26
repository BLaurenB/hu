class GoogleShopAll

  attr_reader :all_stats

  def initialize(shop_array)

    @all_stats = shop_array.map do |week|
      GoogleShopWeekly.new(week)
    end

  end

  def total_standard
    all_stats.standard.sum  #(or do I have to Ruby?)
  end


end
