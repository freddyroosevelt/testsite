class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show, :like]
  before_action :require_user, except: [:show, :index, :like]
  before_action :require_user_like, only: [:like]
  before_action :require_same_user, only: [:edit, :update]
  
  def index
    @posts = Post.paginate(page: params[:page], per_page: 4)
  end
  
  def show
    
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    
    if @post.save
      flash[:success] = "Your Post was created Successfully!"
      redirect_to posts_path
    else
      render :new
    end
  end
  
  
  def edit
    
  end
  
  def update
    
    if @post.update(post_params)
      #do something
      flash[:success] = "Post updated Successfully!"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end
  
  def like
    
    like = Like.create(like: params[:like], user: current_user, post: @post)
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
      params.require(:post).permit(:name, :summary, :description, :picture, trend_ids: [], topic_ids: [])
    end
    
    def set_post
      @post = Post.find(params[:id])
    end
    
    def require_same_user
      if current_user != @post.user
        flash[:danger] = "You can only edit your own profile"
        redirect_to posts_path
      end
    end
    
    def require_user_like
      if !logged_in?
       flash[:danger] = "You must be logged in to perform that action"
       redirect_to :back
      end
    end
  
  
end