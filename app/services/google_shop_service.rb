class GoogleShopService

#need to initialize terms or pass them down the line.

  def initialize(term) #terms as an array
    @term = term
  end


  def scrape

    browser = Watir::Browser.new
    browser.goto("https://trends.google.com/trends/explore?geo=US&gprop=froogle&q=bag,#{@term.word_1},#{@term.word_2},#{@term.word_3},#{@term.word_4}")
    # browser.goto("https://trends.google.com/trends/explore?geo=US&gprop=froogle&q=bag,#{terms.join(',')}"
    browser.button(text: 'file_download').click
    browser.close

  end



  def parse_csv

    Rails.cache.fetch(:google_shop_parse[cache_key]) {
      scrape
      file_path = "/Users/laurenbillington/Downloads/multiTimeline.csv"
      csv_file = File.expand_path(file_path)
      file = File.open(csv_file)
      file.gets
      csv = CSV.new(file, headers: true)
      csv.map do |row|
         row.to_hash
      end
    }
  end

  # def cache_key
  #   terms.join('_')  #should generate a string
  # end


end
