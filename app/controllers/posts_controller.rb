class PostsController < ApplicationController
  
  def index
    @posts = Post.paginate(page: params[:page], per_page: 4)
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user = User.find(1)
    
    if @post.save
      flash[:success] = "Your Post was created Successfully!"
      redirect_to posts_path
    else
      render :new
    end
  end
  
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      #do something
      flash[:success] = "Post updated Successfully!"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end
  
  def like
    @post = Post.find(params[:id])
    like = Like.create(like: params[:like], user: User.first, post: @post)
    if like.valid?
      flash[:success] = "Your selection was Successfully!"
      redirect_to :back
    else
      flash[:danger] = "You can only like/dislike a post once"
      redirect_to :back
    end
  end
  
  
  private
  
    def post_params
      params.require(:post).permit(:name, :summary, :description, :picture)
    end
  
  
end