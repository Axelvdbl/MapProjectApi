class CreateMarkers < ActiveRecord::Migration[5.1]

	def change
		create_table :markers do |t|
			t.string :latitude
			t.string :longitude

			t.timestamps
		end
	end

end
