class TrendsController < ApplicationController
  before_action :require_user, except: [:show]
  
  def show
    @trend = Trend.find(params[:id])
    @posts = @trend.posts.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @trend = Trend.new
  end
  
  def create
    @trend = Trend.new(trend_params)
    if @trend.save
      flash[:success] = "Trend was created successfully"
      redirect_to posts_path
    else
      render 'new'
    end
  end
  
  private
  
    def trend_params
      params.require(:trend).permit(:name)
    end
  
  
end