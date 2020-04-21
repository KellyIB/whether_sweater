class Photo
  attr_reader :image, :id
  def initialize(photo_data)
    @image = get_url(photo_data)
    @id = get_id(photo_data)
  end

  def get_url(photo_data)
    photo_data[:photos][0][:url]
  end

  def get_id(photo_data)
    photo_data[:photos][0][:id]
  end
end
