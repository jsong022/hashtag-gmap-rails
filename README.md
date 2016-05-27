# hashtag-gmap-rails
## version 1.0.0
#### github.com/jsong022/hashtag-gmap-rails

#### Info about application
##### Using:
- Ruby 2.3.0
- Ruby on Rails 4.2.6
- Apache Cassandra 2.1.14
- cassandra-driver 2.1.6 
- Google Maps Javascript API

##### Relevant Files:
* **Gemfile**
  * list of Ruby gems used by this application
* **config/application.rb**
  * contains require statements that applies to this application
  * also contains CassandraClient class definition
    * Ruby class using Datastax Cassandra driver for Ruby (cassandra-driver gem)
* **config/routes.rb**
  * contains Ruby On Rails routes from address to controller action
  1. / => pages#home
  2. /heatmap => pages#heatmap
  3. /search => pages#search
* **app/controllers/pages_controller.rb**
  * contains the 3 controller actions: home, search, heatmap
  1. home - homepage (just a map with the input boxes)
  2. search - search for most popular hashtag of location with or without date
  3. heatmap - create heatmap of all coordinates of a hashtag for a date
* **app/views/pages/home.html.erb**
  * view for the pages#home action
* **app/views/pages/heatmap.html.erb**
  * view for heatmap of hashtag for date
* **app/views/pages/search.html.erb**
  * view for search of database for a location with or without a date

#### Functionalities:
1. Search Cassandra database for locations
  * For Invalid Searches: redirect to homepage
    1. Location field was left empty
    2. Date was not in YYYY-MM-DD format
    3. Query returned no database records
  * For Valid Searches:
    1. Date field was empty:
      * Return up to 5 records, most recent first
    2. Date field was not empty:
      * Return that day's most popular hashtag for the location
      * Put red circles on coordinates where the MPH was found
        * on click: show coordinate
2. Create heatmap of a hashtag for a date
  * For Invalid Searches: redirect to homepage
    1. Hashtag field was empty
    2. Date field was empty
    3. Date was not in YYYY-MM-DD format
    4. Query returned no database records
  * For Valid Searches:
    1. Get all records of the hashtag for the date specified
    2. Create heatmap from the coordinates

#### To Do List
- [x] Load a map on page
- [x] Put a static marker & info box on map
- [x] Geocode locations
- [x] Static SQL query & result handling (__NOTE__: binds to localhost MySQL server)
- [x] Dynamic SQL query based on location search
- [x] Search by Location AND Date
- [x] Switch from MySQL to Cassandra (__NOTE__: still binds to Cassandra server at localhost)
- [x] Alert pop-ups
- [x] Mark coordiantes of hashtags found for single day searches
- [x] Create heatmap of a hashtag for a date
- [x] Click coordinate markers to show coordinate for single date searches
- [ ] Multiple locations & dates in a single search __\*__
- [ ] Remote database __\*__
- [ ] Proper deployment to be publicly accessible __\*__

__\*__ Possible Future Implementation (no immediate plans)
