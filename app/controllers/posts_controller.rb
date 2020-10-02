class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update]
  before_action :authorized
  
  def show
    @community = Community.find(@post["community_id"])
    cookies["this_posts_climber_id"] = @post.climber.id
    cookies["this_posts_community_id"] = @community.id
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
    if authorized_to_edit(cookies["this_posts_climber_id"])
      render :edit
    else
      flash["notice"] = "Can only edit your own posts."
      redirect_to post_path(@post)
    end
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
    @post = Post.find(params[:format].to_i)
    @community = Community.find(@post["community_id"])
    if authorized_to_edit(cookies["this_posts_climber_id"])
      @post.destroy
      flash[:danger] = "Post deleted"
      redirect_to community_path(@community.id)
    else
      flash["notice"] = "Can only delete your own posts."
      redirect_to post_path(@post.id)
    end
  end

  private

  def post_params
    params.require(:post).permit(:climber_id, :community_id, :subject, :content)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
