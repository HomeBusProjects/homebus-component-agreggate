require 'homebus_app_options'

class AggregateHomeBusAppOptions < HomeBusAppOptions
  def app_options(op)
  end

  def banner
    'HomeBus Aggregate Component'
  end

  def version
    '0.0.1'
  end

  def name
    'homebus-aggregate'
  end
end
