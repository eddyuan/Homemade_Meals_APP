class SearchesController < ApplicationController
    def show
        @keyword = params[:q].values[0]
        @q = Meal.ransack(params[:q])
        @meals = @q.result(distinct: true)
    end
end
