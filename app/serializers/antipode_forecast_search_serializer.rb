class AntipodeForecastSearchSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :today, :antipode, :starting_location
end
