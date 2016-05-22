# hashtag-gmap-rails
## version 0.9.6

#### Info about application
##### Using:
- Ruby 2.3.0
- Ruby on Rails 4.2.6
- Cassandra 2.1.14
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

#### To Do List
- [x] Load a map on page
- [x] Put a static marker & info box on map
- [x] Geocode locations
- [x] Static SQL query & result handling
- [x] Dynamic SQL query based on location search
- [x] Search by Location AND Date
- [x] Switch to Cassandra (**NOTE**: still binds to Cassandra server at localhost)
- [ ] Multiple locations & dates in a single search \*
- [ ] Remote database\*
- [ ] Proper deployment to be publicly accessible\*

\* -- Possible Future Implementation (no immediate plans)
