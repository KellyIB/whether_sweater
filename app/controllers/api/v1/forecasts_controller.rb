# rubocop:disable Style/ClassAndModuleChildren

class Api::V1::ForecastsController < ApplicationController
  def show
    forecast_search = ForecastSearch.new(params[:location])
    render json: ForecastSerializer.new(forecast_search.forecast)
  end
end

# rubocop:enable Style/ClassAndModuleChildren
