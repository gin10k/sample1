class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    redirect_to "/contacts/#{comment.contact.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, contact_id: params[:contact_id])
  end
end
