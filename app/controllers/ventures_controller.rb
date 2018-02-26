class VenturesController < ApplicationController

  def index
    @ventures = current_user.ventures.all
  end


  def show


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

    @venture = Venture.where(user: 6).find(params[:id])
    @term = @venture.terms.first # ".first" will change based on whether the user has updated search terms
    industry = @venture.category_id
    @hu_insight = HuInsights.insight_maker(@term) #industry
    binding.pry

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
