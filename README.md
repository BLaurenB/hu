# Hu
Hu (who) is interested in your idea?

This application was created to help would-be Entrepreneurs find out whether or not there is or could be an active market for their ideas. Users are able to authenticate with Google, create a "Venture", associate search terms with that venture, and see graphs of the relative popularity from the Google Shop Engine and the Google Search Engine as well as Census data showing the performance of their prospective industry.

This application was implemented using the following:
* Rails 5.1
* Ruby 2.4.1
* PostgreSQL
* Google Authentication
* Watir - web scraping
* Faraday - API calls
* Redis and Sidekiq for caching Watir tasks
* Bulma (styling)

The application is unable to be hosted on Heroku due to its use of Selenium in conjuction with the Watir gem. Please see the video for live demo.

## Challenges
One goal of this project was to create a solution to a real problem. Google does not have an API for its search data (as of early 2018). Google provides access to limited information via Google Trends.  Users can input search terms, however there are inherent problems for the average user:
 * Data per search term (or search phrase) is presented with relativity only to its own popularity. Therefore there is no way for a user to know the relative popularity of his/her terms compared to other terms or phrases. 
 * Data cannot be accessed via API, but can be downloaded as a CSV
 * CSV files may have the same name as previously downloaded files even if different search terms were used (generic filenames are used)
 * CSV filenames are subject to change and may have the same name as previously downloaded files (generic filenames sometimes changed)

## Solutions
Google search terms normalization:
* I researched popular search terms for 2017 and added one of the terms to each Engine search in order to give Users a better understanding of the general performance of their search terms. For the Shop Engine, I added "bag", and for the Search Engine, I added "news"

CSV file names. Initially, all files were downloaded as "multiTimeline.csv", however sometimes they were downloaded as "multiTimeline.csv.crdownload" (and later, they changed to something totally different).
* To address the initial situation where a filename was the same no matter the contents, I deleted the file as one of the steps in turning the CSV contents into a hash
* To account for the 2 names, I implemented some if/else logic. However, now that I know the filenames are subject to much more change than 1-2 options, I'll need to write code that looks for the most recently downloaded file and renames it to something based on the search terms and a timestamp, then update my cached methods to look for the most recent version of that file for the same terms.

## Looking Ahead
Because Google Trends data is a brittle source for data, I would need to find sources with APIs such as Twitter in order to provide popularity data to users. 


Still to update:

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
