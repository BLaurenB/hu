class GoogleSearchService

attr_reader :terms

  def initialize(term_array)
    @terms = term_array
  end


  def terms_for_link
    (terms.join(',')).gsub(' ','%20')
  end

  def scrape

    browser = Watir::Browser.new
    # browser.goto("https://trends.google.com/trends/explore?geo=US&q=news,#{@term.word_1},#{@term.word_2},#{@term.word_3},#{@term.word_4}")
    browser.goto("https://trends.google.com/trends/explore?geo=US&q=news,#{terms_for_link}")
    browser.button(text: 'file_download').click
    browser.close

  end


  def cache_key
  "google_search_".concat(terms.join('_'))
  end

  def determine_file_name
    if File.exists?"/Users/laurenbillington/Downloads/multiTimeline.csv"
      "/Users/laurenbillington/Downloads/multiTimeline.csv"
    else
      "/Users/laurenbillington/Downloads/multiTimeline.csv.crdownload"
    end
  end



  def parse_csv

    Rails.cache.fetch(cache_key) {
      scrape

      file_path = determine_file_name
      csv_file = File.expand_path(file_path)
      file = File.open(csv_file)
      file.gets
      csv = CSV.new(file, headers: true)
      # File.delete(file_path)
      # binding.pry
      csv.map do |row|
         row.to_hash
      end
    }
  end



end
