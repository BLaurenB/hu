class HuInsights

  attr_reader :google_shop, :google_search, :census

  def initialize(shop_array, search_array) #  census_array
    @google_shop = GoogleShopAll.new(shop_array)
    @google_search = GoogleSearchAll.new(search_array)
    # @census = Census.new(census_array)
  end

  def self.insight_maker(term) #industry
    HuInsights.new(shop_service(term).parse_csv, search_service(term).parse_csv)
    # census_service(industry_code)."census_service_method which sets the wheels in motion retroactively"
  end

  def self.shop_service(term)
    GoogleShopService.new(term)
  end

  def self.search_service(term)
    GoogleSearchService.new(term)
  end

  # def self.census_service(industry)
  #   CensusService.new(industry)
  # end


end
