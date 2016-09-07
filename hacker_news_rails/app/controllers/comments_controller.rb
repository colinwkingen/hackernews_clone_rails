class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to post_path(@comment.post)
    else
      render :new
    end
  end

  def show
    @comment = Comment.find(params[:id])
    render :show
  end

  def edit
    @comment = Comment.find(paramd[:id])
    render :edit
  end

  def update
    @comment = Comment.find(paramd[:id])
    if @comment.update(comment_params)
      redirect_to post_comment_path
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path
  end

  private
  def comment_params
    params.require(:comment).permit(:user, :content)
  end

end
