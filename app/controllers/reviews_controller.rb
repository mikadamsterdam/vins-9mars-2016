class ReviewsController < ApplicationController
before_action :set_wine

def index
  render json: {
    meta: {
      count: @.reviews.count
    },
    reviews: @.reviews.all
  }
 end

def create
  review = Review.new(review_params)
  if review.save
    render json: { review: review }
  else
    render json: { message: 'Coulde not save the review',
                   errors: review.errors }, status: :unprocessible_entity
  end
end

def update
  review = Review.find(params[:id])
  if review.update(review_params)
    render json: { review: review }
  else
    render json: {
      message: 'Could not update the Review',
      errors: review.errors
    }, status: :unprocessible_entity
  end
end

def destroy
  review = Review.find(params[:id])

  if review.destroy
    render json: {task: nil}
  else
    render json: {
      message: 'Could not remove the review'
    }, status: :unprocessible_entity
  end
end



  private
def average_rating
  Review.average(:rating)
end

  def set_wine
    @wine = Wine.find(params[:wine_id])
  end

  def review_params
    params.require(:review).permit(:expert_name, :review, :rating, :wine_id)
  end
end
