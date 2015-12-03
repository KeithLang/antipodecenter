class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
  
    @comment = @post.comments.create(comment_params)
    redirect_to @post
  end

  def comment_params
    params.require(:comment).permit(:post_id, :body)
  end

end
