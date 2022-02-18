class VotesController < ApplicationController
  def create
    meme = Meme.find(params[:meme_id])
    meme.votes.create!(user: current_user)
    redirect_to meme_path(meme)
  end
end
