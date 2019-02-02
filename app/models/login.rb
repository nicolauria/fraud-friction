require 'haversine'

class Login < ApplicationRecord

  def calculate_distance(current_location)
    distance = Haversine.distance(current_location, [self.latitude, self.longitude]).to_miles
    distance *= 2 if self.status == 'FRAUD'
    return distance
  end
end
