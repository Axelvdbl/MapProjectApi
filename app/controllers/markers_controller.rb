class MarkersController < ApplicationController

	skip_before_action :verify_authenticity_token

	def index
		markers = Marker.all
		render :json => array_serializer(markers)
	end

	def show
		marker = Marker.find_by_id(params[:id])
		render :json => marker.render_api
	end

	def create
		marker = CreateMarkerService.perform(permitted_params)
		return api_error(status: 422, errors: marker.errors) unless marker.save
		render(
			json: marker,
			status: 201,
			location: marker_path(marker.id)
		)
	end

	def update
		marker = UpdateMarkerService.perform(permitted_params, params[:id])
		return api_error(status: 422, errors: marker.errors) unless marker.save
		render(
			json: marker.render_api,
			status: 201,
			location: marker_path(marker.id)
		)
	end

	def destroy
		marker = DeleteMarkerService.perform(params[:id])
		return api_error(status: 422, errors: marker.errors) unless marker.destroyed?
		render(
			json: {},
			status:   204,
			location: marker_path(marker.id)
		)
	end

	private

	def permitted_params
		params.require(:marker).permit(
			:latitude,
			:longitude
		)
	end

	def array_serializer markers
		markers_serialized = Array.new
		markers.each do |marker|
			markers_serialized.push(marker.render_api)
		end
		markers_serialized
	end

end
