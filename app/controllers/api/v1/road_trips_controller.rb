# rubocop:disable Style/ClassAndModuleChildren

class Api::V1::RoadTripsController < ApplicationController

  def create
    road_trip = RoadTripsSearch.new(params[:origin], params[:destination])
    render json: RoadTripsSearchSerializer.new(road_trip)
  end
end

# rubocop:enable Style/ClassAndModuleChildren
