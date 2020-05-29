class OrderItemsController < ApplicationController
  def index
    render "index"
  end

  def show
    id = params[:id]
    session[:current_order_id] = id
    orderitem = OrderItem.find(id)
    render "order-content", locals: { orderitem: orderitem }
  end

  def create
  end

  def new
    render "new"
  end

  def change
    order_item = Order.find(session[:current_order_id]).order_items.find_by(menuitem_id: params[:id])
    if params[:menu_item_quantity].to_i > 0
      if order_item
        order_item.menu_item_quantity = params[:menu_item_quantity]
        order_item.save
      else
        render "cart"
      end
    else
      if order_item
        order_item.destroy
      end
    end
    redirect_to menus_path
  end

  def cart
    id = params[:id]
    menuitem = Menuitem.find(id)
    menuitem_name = menuitem.name
    menuitem_price = menuitem.price
    new_orderitem = OrderItem.create!(order_id: session[:current_order_id],
                                      menuitem_id: menuitem.id,
                                      menuitem_name: menuitem.name,
                                      menuitem_price: menuitem.price,
                                      menu_item_quantity: params[:menu_item_quantity])
    if new_orderitem.save
      flash[:success] = "#{params[:menuitem_name]} added to  cart!"
    end

    redirect_to "/order_items"
  end

  def destroy
    id = params[:id]
    orderitem = OrderItem.find(id)
    orderitem.destroy
    redirect_to "/order_items"
  end
end
