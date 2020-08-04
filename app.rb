# coding: utf-8
require 'homebus'
require 'homebus_app'
require 'mqtt'
require 'dotenv'
require 'json'

class AggregateHomeBusApp < HomeBusApp
  def initialize(options)
    @options = options
    super

    Dotenv.load('.env')
    @uuids = ENV['UUIDS'].split(/\s/)
    @subscribed = false
  end

  def setup!
  end

  def work!
    unless @subscribed
      @uuids.each { |uuid| subscribe_to_devices! uuid }
    end

    listen!
  end

  # receive does not yet properly decode the homebus protocol, so we get a raw message
  def receive!(msg)
    if options[:verbose]
      puts msg
    end

    return unless msg[:contents]
    
    ddc = msg[:contents][:ddc]

    publish! ddc, msg[:contents][:payload]
  end

  def manufacturer
    'HomeBus'
  end

  def model
    'Aggregate Component v1'
  end

  def friendly_name
    'Aggregate Component'
  end

  def friendly_location
    'Portland, OR'
  end

  def serial_number
    @uuids.join(', ')
  end

  def pin
    ''
  end

  def devices
    [
      { friendly_name: 'Aggregate Component',
        friendly_location: '',
        update_frequency: 0,
        index: 0,
        accuracy: 0,
        precision: 0,
        wo_topics: [ '#' ],
        ro_topics: [],
        rw_topics: []
      }
    ]
  end
end
