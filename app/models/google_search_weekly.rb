class GoogleSearchWeekly

  attr_reader :standard, :word_1, :word_2, :word_3, :word_4

  def initialize(attrs)
    @week = attrs.values[0]
    @standard = attrs.values[1]
    @word_1_score = attrs.values[2]
    @word_2_score = attrs.values[3]
    @word_3_score = attrs.values[4]
    @word_4_score = attrs.values[5]
  end


end
