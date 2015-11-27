class CommentsController < ApplicationController
  def show
    @comment = Comment.find(params[:id])
    render :show
  end
  def new
    @comment = Comment.new

    render :new
  end

  def create

    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    if params[:comment][:parent_comment_id]
      @parent_comment = Comment.find(params[:comment][:parent_comment_id])
      @comment.parent_comment_id = @parent_comment.id
    else
      @comment.parent_comment_id = nil
    end
    @comment.post_id = params[:comment][:post_id] || @parent_comment.post_id


    if @comment.save
      redirect_to post_url(@comment.post)
    else
      render :new
    end
  end
  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
