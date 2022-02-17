class CommentsController < ApplicationController
  def create
    meme = Meme.find(params[:meme_id])
    comment = meme.comments.create(comment_params)
    unless comment.save
      flash[:alert] = "There was a problem creating the meme"
    end

    redirect_to meme_path(meme)
  end

  private
  def comment_params
    params.require(:comment).permit(:body).merge(user: current_user)
  end
end
