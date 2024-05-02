class HomeController < ApplicationController
    def index
        render json: { "home": "Welcome to Github Actions" }, status: :ok
    end
end
