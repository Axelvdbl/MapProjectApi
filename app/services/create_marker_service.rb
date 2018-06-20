class CreateMarkerService

	def self.perform(permitted_params)
		new.perform(permitted_params)
	end

	def perform(permitted_params)
		persist(permitted_params)
	end

	private

	def persist(permitted_params)
		marker = Marker.create(permitted_params)
		marker
	end

end
