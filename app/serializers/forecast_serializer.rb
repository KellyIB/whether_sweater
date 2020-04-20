class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :today, :hourly, :five_day_forecast
end
