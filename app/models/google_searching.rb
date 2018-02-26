class GoogleSearching

  attr_reader :standard, :word_1, :word_2, :word_3, :word_4

  def initialize(attrs={})
    @standard = attrs[0].value
    @word_1 = attrs[1].value
    @word_2 = attrs[2].value
    @word_3 = attrs[3].value
    @word_4 = attrs[4].value
  end



end
