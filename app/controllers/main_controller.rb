class MainController < ApplicationController
  def index
    render json: '{"message":"Welcome to the crypto challenge api"}'
  end
end
