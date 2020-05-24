class OrdersController < ApplicationController
  def index
  end

  def new
    render "cart"
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
      success: true,
    )
    new_order.save!
    redirect_to orders_path
  end

  def update
    id = params[:id]
    success = params[:success]
    order = current_user.orders.find(id)
    order.success = true
    if @current_user.role == "customer"
      order.delivered = false
    else
      order.delivered = true
      order.delivered_at = DateTime.now
    end
    order.save!
    redirect_to menus_path
  end

  def status
    order = Order.find(params[:id])
    order.delivered = true
    order.delivered_at = DateTime.now
    order.save
    redirect_to orders_path
  end

  def invoice
    order = Order.find(params[:id])
    render "invoice", locals: { order: order }
  end
end
