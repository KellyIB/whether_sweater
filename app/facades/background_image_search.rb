class BackgroundImageSearch
  attr_reader :id, :photo
  def initialize(city_state)
    @city_state = city_state
    @pexel_service = PexelService.new
    @background_image = get_photo
    @photo = @photograph
  end

  def get_photo
    @photo_data ||= @pexel_service.get_photo(@city_state)
    @photograph ||= Photo.new(@photo_data)
  end
end
