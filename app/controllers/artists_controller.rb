class ArtistsController < ApplicationController
  
  before_action :find_artist, only: [:show]

  def index
    @artists = Artist.all
  end

  def show
  end

  def new
    @artist = Artist.new
    3.times { @artist.paintings.build }
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      redirect_to artists_path
    else
      render :new
    end
  end

  private
  def find_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(
      :name,
      paintings_attributes: [:title]
      )
  end
end
