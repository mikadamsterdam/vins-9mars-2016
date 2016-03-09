class ReviewsController < ApplicationController
#before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    #@reviews = Review.all
    #1st I am retrieving the wine thanks to params[wine_id]
    wine = Wine.find(params[:wine_id])
    #2nd I get all the reviews of this wine
  #@reviews = wine.reviews
    @reviews = Review.all

  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    #1st I am retrieving the wine thanks to params[wine_id]
    wine = Wine.find(params[:wine_id])
    #2nd I get all the reviews of this wine thanks to params[:id]
    @review = Review.find(params[:id])
  end

  # GET /reviews/new
  def new
    @review = Review.new
    #1st I am retrieving the wine thanks to params[wine_id]
    wine = Wine.find(params[:wine_id])
    #2nd I am building a new review
    @review = wine.reviews.build

    respond_to do |format|
     format.html # new.html.erb
     format.xml  { render :xml => @comment }
  end
end

  # GET /reviews/1/edit
  def edit
    #1st I am retrieving the wine thanks to params[wine_id]
    wine = Wine.find(params[:wine_id])
    #2nd I retrieve the review thanks to params[:id]
    @review = revie.find(params[:id])
  end

  # POST /reviews
  # POST /reviews.json
  def create
  #@review = Review.new(review_params)

    #1st I am retrieving the wine thanks to params[wine_id]
  @wine = Wine.find(params[:wine_id])
    #2nd I create the review with the arguments in params[:review]
    @review = @wine.reviews.create!(params.require(:review).permit!)

    respond_to do |format|
      if @review.save
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource comment
        format.html { redirect_to [@review.wine, @review], notice: 'Review was successfully created.' }
      else
        format.html { render :new }

      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    #1st I am retrieving the wine thanks to params[wine_id]
    wine = Wine.find(params[:wine_id])
    #2nd I retrieve the review thanks to params[:id]
    @review = wine.reviews.find(params[:id])


    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    #@review.destroy

    #1st I am retrieving the wine thanks to params[wine_id]
    wine = Wine.find(params[:wine_id])
    #2nd I retrieve the review thanks to params[:id]
    @review = wine.reviews.find(params[:id])
    @review.destroy


    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:expert_name, :review, :rating, :wine_id)
    end
end
