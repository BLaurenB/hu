# Hu
Find out Hu(who) to market to!

This application was created to help would-be entrepeneurs find out whether or not there is or could be an active market for their ideas. Users are able to authenticate with Google, create a "Venture", associate search terms with that venture, and see graphs of the relative popularity from the Google Shop Engine and the Google Search Engine as well as Census data showing the performance of their prospective industry.

This application was implemented using the following:
Rails 5.1
Ruby 2.4.1
PostgreSQL
Google Authentication
Watir - web scraping
Faraday - API calls
Redis and Sidekiq for caching Watir tasks
Bulma (styling)

The application is unable to be hosted on Heroku due to its use of Selenium in conjuction with the Watir gem. Please see the video for live demo.

## Challenges
One goal of this project was to create a solution to a real problem. Google does not have an API for its search data (as of early 2018). Google provides access to limited information via Google Trends.  Users can input search terms, however there are inherent problems for the average user:
 * Data per search term (or search phrase) is presented with relativity only to its own popularity. Therefore there is no way for a user to know the relative popularity of his/her terms compared to other terms or phrases. 
 * Data cannot be accessed via API, but can be downloaded as a CSV
 * CSV files may have the same name as previously downloaded files even if different search terms were used (generic filenames are used)
 * CSV filenames are subject to change and may have the same name as previously downloaded files (generic filenames sometimes changed)

## Solutions
I reserached popular search terms and 



* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
