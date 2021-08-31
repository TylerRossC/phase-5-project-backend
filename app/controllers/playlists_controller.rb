class PlaylistsController < ApplicationController

  # GET /playlists
  def index
    if session[:user_id]
      user = User.find(session[:user_id])
      playlists = {playlists: user.playlists}
      render json: playlists, status: :ok
    end
  end

  # POST /playlists
  def create
    if session[:user_id]
      playlist = Playlist.create(playlist_params)
      playlist.update!(user_id: session[:user_id])
      render json: { playlist: playlist }, status: :created
  else
      render json: { errors: ["log in to create a playlist"] }, status: :unauthorized
  end
end
  
# GET /playlists/1
  def show
    playlist = Playlist.find(params[:id])
    render json: {playlist: playlist}
  end


  # PATCH/PUT /playlists/1
  def update
    playlist = Playlist.find(params[:id])
        if playlist[:user_id] == session[:user_id]
            playlist.update(playlist_params)
            render json: { playlist: playlist }, status: :accepted
        else
            render json: {errors: ["Not authorized"]}, status: :unauthorized 
        end
    end

  # DELETE /playlists/1
  def destroy
    playlist = Playlist.find(params[:id])
    if playlist[:user_id] === session[:user_id]
         playlist.destroy 
         head :no_content
    else
     render json: {errors: ["Not authorized"]}, status: :unauthorized 
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def playlist_params
      params.permit(:title, :song_count, :user_id)
    end
end
