class PostsController < ApplicationController
  before_action :check_admin, only: %i[new create]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def search
    @search = params['query']
    @posts = Post.where('country LIKE ?', "%#{@search.upcase}%")
    @posts = Post.where('state LIKE ?', "%#{@search.upcase}%") unless @posts.any?
    @posts = Post.where('city LIKE ?', "%#{@search}%") unless @posts.any?
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = t('.success')
      redirect_to @post
    else
      flash.now[:alert] = t('.failure')
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :country, :state, :city,
                                 :category_id, :text, :image, :restaurant_tip,
                                 :tour_tip)
  end
end
