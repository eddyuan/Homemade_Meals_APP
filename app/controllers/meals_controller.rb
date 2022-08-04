class MealsController < ApplicationController
before_action :find_meal, only: [:edit, :update]

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.user = current_user
    if @meal.save
      flash[:success]= "Meal created successfully!"
      redirect_to meal_path(@meal)
    else
      render :new
    end
  end

  def index
    @meals = Meal.order(updated_at: :desc)

    # top 10 rated cooks query needs to be changed
    @cooks = User.where(is_cook: :true).limit(10)
  end

  def show
    @meal = Meal.find params[:id]
    @reviews = @meal.reviews.order(created_at: :desc)
    @review = Review.new
  end

  def edit
  end

  def update
    if @meal.update(meal_params)
      redirect_to meal_path(@meal)
    else
      render :edit
    end
  end

  def destroy
      @meal = Meal.find params[:id]
      @meal.destroy
      redirect_to meals_path, notice: "Meal Deleted" # should probably redirect to cook admin panel page
  end

  private
  def meal_params
    params.require(:meal).permit(:title, :ingredients, :price)
  end

  def find_meal
    @meal = Meal.find params[:id]
  end
end