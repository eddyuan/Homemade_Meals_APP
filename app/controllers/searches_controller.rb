class SearchesController < ApplicationController
    def show
        @q = Meal.ransack(params[:q])
        @meals = @q.result(distinct: true)
    end
end
