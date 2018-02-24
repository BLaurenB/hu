class VenturesController < ApplicationController


  def index
    # https://trends.google.com/trends/explore?geo=US&gprop=froogle&q=bag,binoculars,laptop,ring,hat


    browser = Watir::Browser.new
    browser.goto('https://trends.google.com/trends/explore?geo=US&gprop=froogle&q=bag,map,laptop,ring,hat')
    # @watir_result =  browser.element(css: 'article header h2')
    # binding.pry
    browser.button(text: 'file_download').click
    browser.close
    #MAKE SURE TO PRVIDE A LINK TO THE GOOGLE PAGE!!!!

  end


end
