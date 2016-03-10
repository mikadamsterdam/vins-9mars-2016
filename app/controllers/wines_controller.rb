class WinesController < ApplicationController
  #before_action :set_wine, only: [:show, :edit, :update, :destroy]

  # GET /wines
  # GET /wines.json

  def index
    wines = Wine.order(id: :asc)
    render json: {
      meta: {
        count: Wine.count,
        page: 0
      },
      wines: wines.as_json({include: :reviews, methods: :average_rating})
    }
  end

  # GET /wines/1
  # GET /wines/1.json

  def show
  wine = Wine.find(params[:id])
  average_rating = wine.average_rating
  render json: {
    wine: wine,
    average_rating: average_rating
  }
end


  def create
    if wine = Wine.create(wine_params)
      render json: { wine: wine }
    else
      render json: {
        message: 'Could not create wine',
        errors: wine.errors
      }, status: :unprocessible_entity
    end
  end

  def update
    wine = Wine.find(params[:id])

    if wine.update(wine_params)
      render json: { wine: wine }
    else
      render json: {
        message: 'Could not update wine',
        errors: wine.errors
      }, status: :unprocessible_entity
    end
  end

  def destroy
    wine = Wine.find(params[:id])

    if wine.destroy
      render json: { wine: nil }
    else
      render json: {
        message: 'Could not destroy wine, please try again'
      }, status: :unprocessible_entity
    end
  end

  private

  def wine_params
    params.require(:wine).permit(:wine_name, :wine_description, :wine_origin)
  end
end
