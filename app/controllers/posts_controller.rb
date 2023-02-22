class PostsController < ApplicationController
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
end
