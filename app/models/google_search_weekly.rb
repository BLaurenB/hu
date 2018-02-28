class GoogleSearchWeekly

  attr_reader :standard, :word_1, :word_2, :word_3, :word_4

  def initialize(attrs)
    @week = attrs.values[0]
    @standard = attrs.values[1].to_i
    @word_1 = attrs.values[2].to_i
    @word_2 = attrs.values[3].to_i
    @word_3 = attrs.values[4].to_i
    @word_4 = attrs.values[5].to_i
  end


end
