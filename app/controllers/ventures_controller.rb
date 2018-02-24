class VenturesController < ApplicationController


  def index

    # agent = Mechanize.new
    # page = agent.get('https://trends.google.com/trends/explore?geo=US&gprop=froogle&q=bag,binoculars,laptop,ring,hat')
    # pp page


    browser = Watir::Browser.new
    browser.goto('https://trends.google.com/trends/explore?geo=US&gprop=froogle&q=bag,binoculars,laptop,ring,hat'
    puts browser.title
    browser.close

  end


end
