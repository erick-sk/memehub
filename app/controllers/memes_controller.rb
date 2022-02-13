class MemesController < ApplicationController
  def index
    memes = Meme.all.order(created_at: :desc)
    @memes_by_date = memes.all.group_by { |meme| meme.created_at.to_datetime }
  end

  def show
  end

  def create
  end

  def new
  end

  def popular
    @memes = Meme.all.order(votes_count: :desc)
  end
end