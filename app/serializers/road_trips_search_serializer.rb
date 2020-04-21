class RoadTripsSearchSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :travel_time, :origin, :destination, :forecast
end
