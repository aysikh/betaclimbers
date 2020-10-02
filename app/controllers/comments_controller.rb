class CommentsController < ApplicationController
  before_action :find_comment, only: [:show, :edit, :update, :delete]
  before_action :authorized

  def show
  end

  def new
    cookies[:post_id] = params[:post_id].to_i
    @post = Post.find(params[:post_id].to_i)
    @comment = Comment.new
  end

  def create
    params["comment"]["climber_id"] = session[:climber_id]
    params["comment"]["post_id"] = cookies[:post_id]
    @post = Post.find(cookies[:post_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:success] = "Comment posted!"
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @comment.update(comment_params)
    if @comment.save
      redirect_to comment_path(@comment)
    else
      render :edit
    end
  end

  def destroy
    redirect_to post_path
  end

  private

  def comment_params
    params.require(:comment).permit(:climber_id, :post_id, :message)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

end
