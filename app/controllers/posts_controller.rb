class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :delete]
  before_action :authorized
  
  def show
  end

  def new
    @post = Post.new
    @comment = Comment.new(post_id: params[:post_id])
  end

  def create
    params["post"]["community_id"] = cookies[:community_id]
    params["post"]["climber_id"] = session[:climber_id]
    @post = Post.new(post_params)
    if @post.save
      flash[:message] = "Post successfully added!"
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @post.update(post_params)
    if @post.save
      flash[:message] = "Post successfully updated!"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    flash[:danger] = "Post deleted"
    redirect_to community_path
  end

  private

  def post_params
    params.require(:post).permit(:climber_id, :community_id, :subject, :content)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
