class AntipodeForecastSearchSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :search_location, :antipode, :today
end
