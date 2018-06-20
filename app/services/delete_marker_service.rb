class DeleteMarkerService

	def self.perform id
		new.perform id
	end

	def perform id
		persist id
	end

	private

 	def persist id
		marker = Marker.find_by_id(id)
		marker.destroy
	end

end
