class GoogleService

#need to initialize terms or pass them down the line.

  def scrape
    browser = Watir::Browser.new
    browser.goto("https://trends.google.com/trends/explore?geo=US&gprop=froogle&q=bag,#{@term.word_1},#{@term.word_2},#{@term.word_3},#{@term.word_4}")
    browser.button(text: 'file_download').click
    # binding.pry
    browser.close
  end



  def parse_csv(file_path_1)
    file_path_1 = "/Users/laurenbillington/Downloads/multiTimeline.csv.crdownload"
    #don't need to pass this, but need to wait to download it!

    csv_file= File.expand_path(file_path_1)
    file = File.open(csv_file)
    file.gets
    csv = CSV.new(file, headers: true)
    csv.map do |row|
       row.to_hash
    end #creates an array of hashes. pass that array to a .each to create all the classlets...
  end



end
