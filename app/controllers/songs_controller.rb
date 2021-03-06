class SongsController < ApplicationController
    before_action :get_song, only: [:show, :edit, :update]

    def new
        @song = Song.new
    end

    def create
        song = Song.create(song_params(:name, :artist_id, :genre_id))
        redirect_to song_path(song)
    end

    def index
        @songs = Song.all 
    end

    def show

    end

    def edit

    end

    def update
        @song.update(song_params(:name, :artist_id, :genre_id))
        redirect_to song_path(@song)
    end

    private

    def get_song
        @song = Song.find(params[:id])
    end

    def song_params(*args)
        params.require(:song).permit(*args)
    end

end
