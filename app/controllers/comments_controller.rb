class CommentsController < ApplicationController
  
  def create
    # Save object post to send action show
    @post = Post.where(id: params[:post_id]).take
    # Start query to save
    @user_comment = @post.comments.create(params_vars)
    # Create an instance to create a new comment in view post(prefix)
    @comment = Comment.new
    #  Get all comments this post has and send data to view again
    @comments = Comment.where(post_id: @post.id).order(created_at: :desc)

    if @user_comment.save
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  private
    def params_vars
      params.require(:comment).permit(:comentario).merge(user: current_user)
    end
end
