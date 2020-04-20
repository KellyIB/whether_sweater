class Api::V1::AntipodesController < ApplicationController
  def show
    antipode_forecast_search = AntipodeSearch.new(params[:location])
    render json: AntipodeForecastSearchSerializer.new(antipode_forecast_search)
  end
end
