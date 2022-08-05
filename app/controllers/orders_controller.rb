class OrdersController < ApplicationController
    before_action :find_meal, only: [:new, :create]

    def new
        @order = Order.new
    end

    def create
        @order = Order.new(params.require(:order).permit(:recipient, :address))
        @order.user = current_user
        @order.meal = @meal

        if @order.save
            flash[:notice] = "Order created successfully!"
            redirect_to show_admin_panel_user_path(current_user)
        else
            flash[:alert] = "Cannot create order!"
            render "/orders/new", status: 303
        end

    end

    def show
        @order = Order.find(params[:id])
    end

    private
    def find_meal
        @meal = Meal.find(params[:meal_id])
    end
end
