class ArtworksController < ApplicationController

    def index
      render json: Artwork.user_artworks(params[:user_id])
    end

    def show
      render json: Artwork.find(params[:id])
    end

    def create
      artwork = Artwork.new(artwork_params)
      if artwork.save
        render json: artwork
      else
        render json: artwork.errors.full_messages, status: :unprocessable_entity
      end
    end

    def update
      artwork = Artwork.find(params[:id])
      artwork.update_attributes(artwork_params)
    end

    def destroy
      @artwork = Artwork.find(params[:id])
      if @artwork.exist?
        @artwork.delete
        render json: @artwork
      else
        render json: @artwork.errors.full_messages
      end
    end

    private

    def artwork_params
      params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end
