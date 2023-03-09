class ProductsController < ApplicationController
  def index
    response = Faraday.get('http://localhost:4000/api/v1/products')
    @products = JSON.parse(response.body)
  end
end