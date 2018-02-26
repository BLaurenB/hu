class VenturesController < ApplicationController

  def index
    @ventures = current_user.ventures.all
  end


  def show
    @venture = Venture.where(user: 6).find(params[:id])
    @term = @venture.terms.first
    # -------------------------------------------
    # Google Trends - Shopping and Search. Make into a Service and Decorators
    # -------------------------------------------
    # Rails.cache.fetch(:get_google_csv, expires_in: 7.days)  {} #Need to cache each run - shopping and searching separately!

    # #SHOPPING
      # browser = Watir::Browser.new
      # browser.goto("https://trends.google.com/trends/explore?geo=US&gprop=froogle&q=bag,#{@term.word_1},#{@term.word_2},#{@term.word_3},#{@term.word_4}")
      # browser.button(text: 'file_download').click
      # # binding.pry
      # browser.close

        file_path_1 = "/Users/laurenbillington/Downloads/multiTimeline.csv.crdownload"

        csv_text_1 = File.expand_path(file_path_1)

        file = File.open(csv_text_1)
        file.gets
        csv = CSV.new(file, headers: true)
        csv.each do |row|
           GoogleShopping.new(row.to_hash)
        end

        # @google_shopping = SomeOtherGoogleClass.classmethod(terms?)I want to be able to call @gsh.term_1_hu_score (which is all term_1s averaged/ all standards averaged.)



        # firstTime = true
        # CSV.foreach
        #     if firstTime, break and set firstTime = false
        #     do stuff
        #  end

        # {"Category: All categories"=>"Week", nil=>"backpack: (United States)"}
        # {"Category: All categories"=>"2017-02-19", nil=>"36"}

    #SEARCHING
      # browser = Watir::Browser.new
      # browser.goto("https://trends.google.com/trends/explore?geo=US&q=news,#{@term.word_1},#{@term.word_2},#{@term.word_3},#{@term.word_4}")
      # browser.button(text: 'file_download').click
      # browser.close
      #
      #   file_path_2 = "/Users/laurenbillington/Downloads/multiTimeline.csv"
      #   csv_text_2 = File.open(File.expand_path(__FILE__, file_path_2)).read
      #   # csv_text_2 = File.read(file_path_2)
      #   csv = CSV.parse(csv_text_2, :headers => true, :encoding => 'ISO-8859-1')
      #   csv.each do |row|
      #     GoogleSearching.create(row.to_hash)
      #   end



    # -------------------------------------------
    # Census Trends  - Overall US, Industry specific
    # -------------------------------------------



  end


  def new
    @venture = Venture.new
    @categories = Category.all
  end

  def create
    venture = current_user.ventures.new(venture_params)
    if venture.save
      redirect_to new_term_path
    else
      render :new
    end
  end

  private

    def venture_params
      params.require(:venture).permit(:title, :description, :notes, :category_id)
    end

end
