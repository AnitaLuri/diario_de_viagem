class ProductsController < ApplicationController
  def index
    response = Faraday.get('https://fakestoreapi.com/products')
    @products = JSON.parse(response.body)
  end
end
