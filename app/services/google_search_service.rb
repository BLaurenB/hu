class GoogleSearchService

#need to initialize terms or pass them down the line.

  def initialize(term)
    @term = term
  end


  def scrape
    Rails.cache.fetch(:google_search_scrape) {
      browser = Watir::Browser.new
      browser.goto("https://trends.google.com/trends/explore?geo=US&q=news,#{@term.word_1},#{@term.word_2},#{@term.word_3},#{@term.word_4}")
      browser.button(text: 'file_download').click
      browser.close
    }
  end



  def parse_csv
    scrape

    Rails.cache.fetch(:google_search_parse) {
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



end
