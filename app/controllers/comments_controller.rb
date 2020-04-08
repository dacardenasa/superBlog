class CommentsController < ApplicationController
  def create
    # Start query to save
    user_comment = Comment.create(params_vars)
    # Access to vars form  with params.require
    permit = params.require(:comment).permit(:post_id)
    # Save object post to send action show
    @post = Post.find(permit[:post_id])
    # Create an instance to create a new comment in view post(prefix)
    @comment = Comment.new
    #  Get all comments this post has and send data to view again
    @comments = Comment.where(post_id: permit[:post_id]).order(created_at: :desc)
    if user_comment.save
      render 'posts/show'
    else
      @errores = user_comment.errors.full_messages
      render 'posts/show'
    end
  end

  private
    def params_vars
      params.require(:comment).permit(:user_id, :post_id, :comentario)
    end
end
