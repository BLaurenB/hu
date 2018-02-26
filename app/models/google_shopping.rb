class GoogleShopping

  attr_reader :standard, :word_1, :word_2, :word_3, :word_4

  def initialize(attrs)
    @week = attrs.values[0]
    @standard = attrs.values[1]
    @word_1 = attrs.values[2]
    @word_2 = attrs.values[3]
    @word_3 = attrs.values[4]
    @word_4 = attrs.values[5]
  end


  def self.make_shopping_classlets(parse_csv)
    parse_csv.each do |row|
      GoogleShopping.new(row)
    end
  end


end
