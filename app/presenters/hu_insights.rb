class HuInsights

  attr_reader :google_shop, :google_search, :census

  def initialize(shop_array, search_array) #, census_array
    @google_shop = GoogleShopAll.new(shop_array)
    @google_search = GoogleSearchAll.new(search_array)
    # @census = Census.new(census_array)
  end

  def self.insight_maker(terms) #industry_code
    HuInsights.new(
      shop_service(terms)."shop_service_method which sets the wheels in motion retroactively",
      search_service(terms)."shop_service_method which sets the wheels in motion retroactively"
    )
      # census_service(industry_code)."census_service_method which sets the wheels in motion retroactively" 
  end

  def self.shop_service(terms)
    GoogleShopService.new(terms)
  end

  def self.search_service(terms)
    GoogleSearchService.new(terms)
  end

  # def self.census_service(terms)
  #   CensusService.new(terms)
  # end





end
