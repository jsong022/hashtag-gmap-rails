# hashtag-gmap-rails
### version 0.9.6

## Functionalities:
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
