class TopicsController < ApplicationController
  before_action :require_user, except: [:show]
  
  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      flash[:success] = "Topic was created successfully"
      redirect_to posts_path
    else
      render 'new'
    end
  end
  
  private
  
    def topic_params
      params.require(:topic).permit(:name)
    end
  
  
end