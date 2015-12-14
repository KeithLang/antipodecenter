class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    
    @comment = @post.comments.create(comment_params)
    redirect_to @post
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully deleted.' }
      format.json { head :no_content }
    end
  end


  def comment_params
    params.require(:comment).permit(:post_id, :body)
  end

  
end
