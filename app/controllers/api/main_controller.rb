module Api


class MainController < ApplicationController

  before_filter :authenticate_request!
  
  def index
    render json: '{"message":"Welcome to the crypto challenge api"}'
  end
end

end