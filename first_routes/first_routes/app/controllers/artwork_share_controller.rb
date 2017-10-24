class ArtworkShareController < ApplicationController
  def create
    @artwork_share = ArtworkShare.new(artwork_shares_params)
    if @artwork_share.save
      render json: @artwork_share
    else
      render json: @artwork_share.errors.full_messages
    end
  end

  def destroy
    @artwork_share = ArtworkShare.find(artwork_shares_params)
    if @artwork_shares.destroy
      render json: @artwork_shares
    else
      render json: @artwork_shares.errors.full_messages
    end
  end


  private
  def artwork_shares_params
    params.require(:artwork_share).permit(:artwork_id, :viewer_id)
  end
end
