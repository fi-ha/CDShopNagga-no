class SongsController < ApplicationController
	before_action :authenticate_user!
	
	def create
		@song = Song.new(song_params)
		@song.save
	end

	def update
	end

	def destroy
	end

	private
	def song_params
		params.require(:song).permit(:song_name, :disk, :number)
	end

end
