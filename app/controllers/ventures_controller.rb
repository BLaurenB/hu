class VenturesController < ApplicationController

  def index
    @ventures = current_user.ventures.all
  end


  def show
    @venture = Venture.where(user: 6).find(params[:id])
    # -------------------------------------------
    # Google Trends - Shopping and Search
    # -------------------------------------------


    #get search terms from Terms table
    # browser = Watir::Browser.new
    # browser.goto('https://trends.google.com/trends/explore?geo=US&gprop=froogle&q=bag,map,laptop,ring,hat')
    # browser.button(text: 'file_download').click
    #
    # browser.goto('https://trends.google.com/trends/explore?geo=US&q=news,backpack,commuter,bus,laptop')
    # browser.button(text: 'file_download').click
    #
    # browser.close
    #MAKE SURE TO PRVIDE A LINK TO THE GOOGLE PAGE!!!!



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
