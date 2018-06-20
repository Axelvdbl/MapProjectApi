class UpdateMarkerService

	def self.perform(permitted_params, id)
		new.perform(permitted_params, id)
	end

	def perform(permitted_params, id)
		persist(permitted_params, id)
	end

	private

	def persist(permitted_params, id)
		marker = Marker.find_by_id(id)
		marker.update_attributes permitted_params
		marker
	end

end
