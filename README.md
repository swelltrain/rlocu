# Rlocu

A simple, unoffical, and somewhat complete wrapper for the Locu Version 2 API (locu.com)

Currrently supports Venue Searches by
* lat long radius
* locu id
* in categories
* with menus

## Installation

Add this line to your application's Gemfile:

    gem 'rlocu'

And then execute:

    $ bundle install

Or install it yourself:

    $ gem install rlocu

## Getting Started

Before executing any Rlocu queries you need to config it.

    Rlocu.config do |conf|
      conf.api_key = 'yourapikeyyourapikeyyourapikey'
    end

## Usage
In general you search Locu with `RLocu::VenueSearch`.

The class takes an optional parameter `return_fields` which is an array of venue fields* (properties) that should be returned.  It defaults to:

    %w{locu_id name location description menus}

*See Locu Developer Docs for available fields.

There are several instance methods that follow the typical usage pattern.  Each adds a `QueryBuilder::KeyValueCondition` to the `@key_value_conditions` array and returns `self` so they can be chained together.  This creates a restrictive && filter (ie search for venues that satisfy this condition and this condition.)  Then you call `search` to perform the search with the query that has been built.

Example:

    venues = Rlocu::VenueSearch.new.in_lat_long_radius(lat: my_latitude, long: my_longitude, radius: 2000).with_menus.search

The instance methods have the following naming convention:

`with_[propery name]` means that property is $present.

`[property name](value)` means that property has that value.

## The Objects

`Rlocu::Venue` has many `Rlocu::Menu`.  Both objects map instance variables to (most of) the properties from the Locu API.


`RLocu::Menu#to_s` creates a rough  ascii print of the menu, but should give a fairly decent example for displaying.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
