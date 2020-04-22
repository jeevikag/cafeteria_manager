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
    redirect_to orderitems_path
  end
end
=begin
  def update
    id = params[:id]
    order = Order.find(id)
    order.delivered_at = DateTime.now
    order.save!
    redirect_to orders_path
  end

  def display
    @not_delivered_orders = Order.not_delivered_user(current_user.id)
    @delivered_orders = Order.delivered_user(current_user.id)
    render "orders/show"
  end

  def invoices
    @orders = Order.get_list(params[:from_date], params[:to_date])
    session[:orders] = @orders
    redirect_to reports_path
  end

  def customer_invoices
    @orders = Order.get_customer_list(params[:from_date], params[:to_date], params[:customer_id])
    session[:orders] = @orders
    redirect_to reports_path
  end
end
=end
