class SongsController < ApplicationController

    def create
        if session[:user_id]
          song = Song.create(song_params)
          render json: { song: song }, status: :created
      else
          render json: { errors: ["log in to add song to playlist"] }, status: :unauthorized
      end
    end


    def destroy
        song = Song.find(params[:id])
        song.destroy 
        head :no_content
    end
    
    private 
    
    def song_params
        params.permit(:title, :artist, :playlist_id)
    end
end