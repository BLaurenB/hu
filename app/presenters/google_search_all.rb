class GoogleSearchAll

  attr_reader :all_stats

  def initialize(search_array)

    @all_stats = search_array.map do |week|
      GoogleSearchWeekly.new(week)
    end

  end

  def total_standard
    all_stats.standard.sum  #(or do I have to Ruby?)
  end


end
