# hashtag-gmap-rails
## version 0.9.9

#### Info about application
##### Using:
- Ruby 2.3.0
- Ruby on Rails 4.2.6
- Apache Cassandra 2.1.14
- cassandra-driver 2.1.6 
- Google Maps Javascript API

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
