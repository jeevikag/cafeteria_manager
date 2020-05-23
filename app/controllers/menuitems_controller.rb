class MenuitemsController < ApplicationController

  def index
    render "index"
  end

  def show
    id = params[:id]
    @menuitem = Menuitem.find(id)
  end

  def new
    menu_id = params[:menu_id]
    menuitem_id = params[:menuitem_id]
    name = params[:name]
    description = params[:description]
    price = params[:price]
    new_menuitem = Menuitem.new(
      menu_id: current_menu.id,
      menuitem_id: menuitem_id,
      name: name,
      description: description,
      price: price,
    )
    if new_menuitem.save
      redirect_to cartitems_path
    end
  end

  def create
    name = params[:name]
    description = params[:description]
    price = params[:price]
    menuitem_id = params[:menuitem_id]
    new_menuitem = Menuitem.new(
      menu_id: session[:current_menu_id],
      menuitem_id: menuitem_id,
      name: name,
      description: description,
      price: price,
    )
    if new_menuitem.save
      redirect_to "/menuitems"
    else
      flash[:error] = new_menuitem.errors.full_messages.join(", ")
      redirect_to "/menuitems"
    end
  end

  def update
    id = params[:id]
    name = params[:name]
    menuitem = Menuitem.of_menu(current_menu).find(id)
    menuitem.name = name
    menuitem.save
    redirect_to menuitems_path
  end

  def destroy
    id = params[:id]
    menuitem = Menuitem.find(id)
    menuitem.destroy
    redirect_to menuitems_path
  end
end
