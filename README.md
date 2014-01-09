# Rlocu

A simple, unoffical, and currently incomplete wrapper for the Locu API (locu.com)

## Installation

Add this line to your application's Gemfile:

    gem 'rlocu'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rlocu

## Getting Started

When you require Rlocu it runs config! on itself to set api_key and http_base.  It reads these values from a YAML .config file in .lib/ exa:

API_KEY: 'yourapikeyyourapikeyyourapikey'
HTTP_BASE: 'https://api.locu.com/v1_0/'

## Usage

Right now the only functionality covered is Venue Search to search for venues, and Venue Details which gets you menus, etc.
Everything is under the Rlocu namespace. 

Venue Search
Pass a hash of params to Rlocu::VenueSearch.query()
Returns an array of venues (Rlocu::Venue)
Or you can pass it a block to iterate through the venues:

    Rlocu::VenueSearch.query(postal_code: '90278', cuisine: 'Thai') do |v|
      puts v.name
    end

Venue Details
You can pass an array of up to 5 venues to Rlocu::VenueDetails()
Returns an array of Rlocu::Venues with the detail data (th venue search and detail search have overlapping attributes).

Or you can pass it a block to iterate through the venues:
    Rlocu::VenueDetails.query(array_of_venues) do |v|
      puts v.twitter_id
    end

Object Space
The object space essentially follows the Locu API with two little utility objects:
RLocu::Location
Rlocu::Bounds

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
