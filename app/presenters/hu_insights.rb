class HuInsights

  attr_reader :google_shop, :google_search, :census

  def initialize(shop_array, search_array, census_array)
    # binding.pry
    @google_shop = GoogleShopAll.new(shop_array)
    @google_search = GoogleSearchAll.new(search_array)
    @census = Census.new(census_array)
  end

  def self.insight_maker(term_array, industry)
    # binding.pry
    HuInsights.new(shop_service(term_array).parse_csv, search_service(term_array).parse_csv, census_service(industry).get_data)
  end

  def self.shop_service(term_array)
    GoogleShopService.new(term_array)
  end

  def self.search_service(term_array)
    GoogleSearchService.new(term_array)
  end

  def self.census_service(industry)
    CensusService.new(industry)
  end


end
