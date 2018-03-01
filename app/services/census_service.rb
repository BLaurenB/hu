class CensusService

  attr_reader :code

  def initialize(code)
    @code = code.to_i
  end

  def connection
    Faraday.new("https://api.census.gov") do |f|
      f.headers['Content-Type'] = 'application/json;charset=utf-8'
      f.adapter Faraday.default_adapter
    end
  end

  def get_data
    response = connection.get("/data/timeseries/eits/marts?get=cell_value&time=from+2016-01+to+2017-12&seasonally_adj=yes&category_code=#{code}&data_type_code=SM&key=#{ENV['US_CENSUS_KEY']}")
    JSON.parse(response.body)
    # binding.pry
  end



end
