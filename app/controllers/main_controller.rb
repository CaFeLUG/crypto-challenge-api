class MainController < ApplicationController

  before_filter :authenticate_request!, except: [:create]

  def index
    render json: '{"message":"Welcome to the crypto challenge api"}'
  end
end
