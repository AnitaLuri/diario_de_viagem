class HomeController < ApplicationController
  def welcome
    @posts = Post.last(3)
  end
end
