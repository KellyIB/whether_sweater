# rubocop:disable Style/ClassAndModuleChildren

class Api::V1::BackgroundsController < ApplicationController
  
  def show
    background_search = BackgroundImageSearch.new(params[:location])
    render json: PhotoSerializer.new(background_search.photo)
  end
end

# rubocop:enable Style/ClassAndModuleChildren
