class OrdersController < ApplicationController
  def index
    if User.find(session[:current_user_id]).role == "customer"
      orders = Order.where(user_id: session[:current_user_id])
    else
      orders = Order.all
    end

    render "index", locals: { orders: orders }
  end

  def new
    if session[:current_order_id] == nil
      flash[:error] = "Your Cart Is Empty"
      redirect_to menus_path
    else
      order = Order.find(session[:current_order_id])
      order.price = 0
      order.order_items.each do |order_item|
        order.price = order.price + order_item.menuitem_price * order_item.menu_item_quantity
      end
      order.save
      if order.price > 0
        render "new", locals: { order: order }
      else
        flash[:error] = "Your cart Is empty,select an item,May be the Items You added had removed by owner"
        redirect_to "/menus/#{session[:current_menu_id]}"
      end
    end
  end

  def deliverOrder
    id = params[:id]
    order = Order.find(id)
    order.status = "delivered"
    order.delivered_at = DateTime.now
    order.save
    redirect_to "/orders#index"
  end

  def show
    id = params[:id]
    session[:current_order_id] = id
    orderitem = OrderItem.find(id)
    render "index", locals: { orderitem: orderitem }
  end

  def create
    new_order = Order.create!(
      date: Date.today,
      user_id: @current_user.id,
      success: true,
    )
    if new_order.save!
      redirect_to "menus/#{session[:current_menu_id]}"
      #redirect_to cart_path
    end
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

  def confirm
    order = Order.find(session[:current_order_id])
    order.order_items.each do |order_item|
      if order_item.menu_item_quantity <= 0
        OrderItem.destroy(order_item.id)
      end
    end
    if @current_user.role == "customer" || @current_user.role == "clerk"
      order.status = "notdelivered"
      order.save
      session[:current_order_id] = nil
      redirect_to "/orders#index"
    else
      order.status = "delivered"
      order.delivered_at = DateTime.now
      order.save
      session[:current_order_id] = nil
      redirect_to menus_path
    end
  end

  def invoice
    order = Order.find(params[:id])
    render "invoice", locals: { order: order }
  end
end
