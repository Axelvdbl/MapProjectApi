class Marker < ApplicationRecord

	def render_api
	{
		id: self.id,
		created_at: self.created_at,
		latitude: self.latitude,
		longitude: self.longitude
	}
	end

end
