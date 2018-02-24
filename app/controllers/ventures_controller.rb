class VenturesController < ApplicationController


  def index
    # https://trends.google.com/trends/explore?geo=US&gprop=froogle&q=bag,binoculars,laptop,ring,hat


    browser = Watir::Browser.new
    browser.goto('https://trends.google.com/trends/explore?geo=US&gprop=froogle&q=bag,map,laptop,ring,hat')
    # @watir_result =  browser.element(css: 'article header h2')
    # binding.pry
    browser.button(text: 'file_download').click

    # browser.button(:xpath => "//button[@onclick='wizardAction(\'start\', \'Starte Upgrade\')']").click
    # element.class_name
    # element.click
    # browser.wait_until { browser.h1.text != 'Main Page' }

    browser.close

  end


end
