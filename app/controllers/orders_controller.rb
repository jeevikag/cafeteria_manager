class OrdersController < ApplicationController
  def index
  end

  def show
    @id = params[:id]
    @order_items = OrderItem.ordered_items(@id)
    render plain: "These are the lists"
  end

  def create
    new_order = Order.create!(
      date: Date.today,
      user_id: @current_user.id,
    )
    new_order.save!
    redirect_to orders_path
  end
end
