class GoogleSearchAll

  attr_reader :all_stats, :standard_average, :word_1_average, :word_2_average, :word_3_average, :word_4_average

  def initialize(search_array)

    @all_stats = search_array.map do |week|
      GoogleSearchWeekly.new(week)
    end

  end


  def standard_average # avails as @hu_insight.google_search.standard_average
    @all_stats.reduce(0){|sum, instance|sum + instance.standard}/52.0
  end

  def word_1_average
    @all_stats.reduce(0){|sum, instance|sum + instance.word_1}/52.0
  end

  def word_2_average
    @all_stats.reduce(0){|sum, instance|sum + instance.word_2}/52.0
  end

  def word_3_average
    @all_stats.reduce(0){|sum, instance|sum + instance.word_3}/52.0
  end

  def word_4_average
    @all_stats.reduce(0){|sum, instance|sum + instance.word_4}/52.0
  end

  def word_1_insight
    ((word_1_average / standard_average) * 100).to_i
  end

  def word_2_insight
    ((word_2_average / standard_average) * 100).to_i
  end

  def word_3_insight
    ((word_3_average / standard_average) * 100).to_i
  end

  def word_4_insight
    ((word_4_average / standard_average) * 100).to_i
  end

  def search_chart_data
    [word_1_insight, word_2_insight, word_3_insight, word_4_insight]
  end

end
