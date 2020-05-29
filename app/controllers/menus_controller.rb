class MenusController < ApplicationController
  def index
    order = Order.where(user_id: session[:current_user_id])
    if order
      previous_order = order.find { |order| order[:status] == "notprocessed" }
      if previous_order
        session[:current_order_id] = previous_order.id
      else
        user_id = session[:current_user_id]
        Order.create!(user_id: user_id, date: DateTime.now, delivered_at: nil, status: "notprocessed")
        session[:current_order_id] = Order.last.id
      end
    else
      user_id = session[:current_user_id]
      Order.create!(user_id: user_id, date: DateTime.now, delivered_at: nil, status: "notprocessed")
      session[:current_order_id] = Order.last.id
    end
    render "index"
  end

  def create
    new_menu = Menu.new(name: params[:name], active: false)

    if new_menu.save
      redirect_to "/menus"
    else
      flash[:error] = new_menu.errors.full_messages.join(", ")
      redirect_to "/menus"
    end
  end

  def show
    id = params[:id]
    session[:current_menu_id] = id
    menu = Menu.find(id)
    render "menu-content", locals: { menu: menu }
  end

  def update
    id = params[:id]
    if params[:active]
      active = true
    else
      active = false
    end
    menu = Menu.find(id)
    menu.active = active
    menu.save
    redirect_to "/menus"
  end

  def destroy
    id = params[:id]
    menu = Menu.find(id)
    menu.destroy
    redirect_to "/menus"
  end
end
