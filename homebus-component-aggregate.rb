#!/usr/bin/env ruby

require './options'
require './app'

aggregate_app_options = AggregateHomeBusAppOptions.new

aggregate = AggregateHomeBusApp.new aggregate_app_options.options
aggregate.run!
