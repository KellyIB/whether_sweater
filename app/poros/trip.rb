class Trip
  attr_reader :travel_time
  def initialize(data)
    @travel_time = data[:routes][0][:legs][0][:duration]
  end
end
